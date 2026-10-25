#!/usr/bin/env bash
# init.sh - bootstrap a fresh Arch Linux install from this repo.
# Usage (as your normal user, from the cloned repo):  sudo ./init.sh
set -euo pipefail

G='\033[0;32m'; Y='\033[1;33m'; R='\033[0;31m'; N='\033[0m'
info()  { echo -e "${G}[+]${N} $*"; }
warn()  { echo -e "${Y}[!]${N} $*"; }
error() { echo -e "${R}[✗]${N} $*"; exit 1; }

[[ $EUID -eq 0 ]] || error "Run with sudo:  sudo ./init.sh"
U="${SUDO_USER:-}"
[[ -n "$U" && "$U" != root ]] || error "Run via sudo from your normal user, not as root directly."
H="$(getent passwd "$U" | cut -d: -f6)"
DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# run a command as the target user, ignoring the repo's ssh-rewriting .gitconfig
# so https clones work before ssh keys exist
as_user() { sudo -u "$U" -H env GIT_CONFIG_GLOBAL=/dev/null "$@"; }

# AUR helpers call sudo themselves; allow it without a password until we exit
SUDOERS_TMP=/etc/sudoers.d/99-dotfiles-init
echo "$U ALL=(ALL) NOPASSWD: ALL" > "$SUDOERS_TMP"
chmod 440 "$SUDOERS_TMP"
trap 'rm -f "$SUDOERS_TMP"' EXIT

# ---------------------------------------------------------------- packages
PACMAN_PKGS=(
    base-devel git curl wget unzip
    # Compositor & bar
    niri xwayland-satellite waybar
    # Notifications
    mako libnotify
    # Launcher
    rofi-wayland
    # Wallpaper & lock
    swaybg swaylock
    # Terminal & shell
    ghostty zsh tmux fzf
    # Editor + tooling for nvim plugins / mason
    neovim tree-sitter-cli ripgrep fd gcc make nodejs npm python python-pip go
    # CLI tools
    lazygit btop k9s kubectl
    # Tray & clipboard
    networkmanager network-manager-applet wl-clipboard cliphist
    # Media & audio
    pipewire pipewire-pulse wireplumber playerctl pavucontrol
    # Brightness & sensors
    brightnessctl lm_sensors
    # Portals (screenshots, file pickers)
    xdg-desktop-portal xdg-desktop-portal-gnome
    # Fonts & icons
    ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji papirus-icon-theme
    # Misc
    polkit-gnome
)

AUR_PKGS=(
    matugen   # Material You palette from wallpaper
    clipit    # clipboard history (niri autostart)
    wlogout   # waybar power button
    nvm       # sourced by .zshrc
)

info "Installing pacman packages..."
pacman -Syu --needed --noconfirm "${PACMAN_PKGS[@]}"

if ! command -v yay &>/dev/null && ! command -v paru &>/dev/null; then
    info "Installing yay..."
    tmp="$(as_user mktemp -d)"
    as_user git clone --depth 1 https://aur.archlinux.org/yay-bin.git "$tmp/yay-bin"
    (cd "$tmp/yay-bin" && as_user makepkg -si --noconfirm)
    rm -rf "$tmp"
fi
AUR_HELPER="$(command -v yay || command -v paru)"

info "Installing AUR packages via $(basename "$AUR_HELPER")..."
as_user "$AUR_HELPER" -S --needed --noconfirm "${AUR_PKGS[@]}"

install -m 755 "$DOTFILES/scripts/tmux-sessionizer" /usr/local/bin/tmux-sessionizer

# ---------------------------------------------------------------- configs
info "Copying configs into $H..."
for d in niri waybar rofi mako ghostty gtk-3.0 gtk-4.0 nvim lazygit btop k9s git wallpapers; do
    as_user mkdir -p "$H/.config/$d"
    as_user cp -rT "$DOTFILES/$d" "$H/.config/$d"
    echo "  $d → $H/.config/$d"
done
as_user chmod +x "$H"/.config/niri/{wallpaper-picker,volume-osd,brightness-osd} "$H"/.config/waybar/modules/*.sh
as_user mkdir -p "$H/Pictures/Screenshots" "$H/scripts"
as_user cp -rT "$DOTFILES/scripts/tmux" "$H/scripts/tmux"

# ---------------------------------------------------------------- shell
if [[ ! -d "$H/.oh-my-zsh" ]]; then
    info "Installing oh-my-zsh..."
    as_user git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git "$H/.oh-my-zsh"
fi
ZC="$H/.oh-my-zsh/custom/plugins"
for repo in zsh-users/zsh-autosuggestions zsh-users/zsh-syntax-highlighting jocelynmallon/zshmarks; do
    [[ -d "$ZC/${repo#*/}" ]] || as_user git clone --depth 1 "https://github.com/$repo.git" "$ZC/${repo#*/}"
done
chsh -s /usr/bin/zsh "$U"

# ---------------------------------------------------------------- tmux / nvim
[[ -d "$H/.tmux/plugins/tpm" ]] || as_user git clone --depth 1 https://github.com/tmux-plugins/tpm "$H/.tmux/plugins/tpm"
as_user cp "$DOTFILES/.zshrc" "$DOTFILES/.tmux.conf" "$H/"
as_user "$H/.tmux/plugins/tpm/bin/install_plugins" || warn "tmux plugins failed - press prefix+I inside tmux"

info "Installing nvim plugins..."
as_user nvim --headless "+Lazy! restore" +qa || warn "nvim plugin install failed - open nvim and run :Lazy"

# copied last: it rewrites https github/gitlab URLs to ssh, which breaks the clones above until keys exist
as_user cp "$DOTFILES/.gitconfig" "$H/.gitconfig"

# ---------------------------------------------------------------- system
info "Enabling services & dark mode..."
systemctl enable --now NetworkManager
as_user dbus-run-session gsettings set org.gnome.desktop.interface color-scheme prefer-dark 2>/dev/null || true
as_user dbus-run-session gsettings set org.gnome.desktop.interface gtk-theme   Adwaita-dark 2>/dev/null || true
as_user dbus-run-session gsettings set org.gnome.desktop.interface icon-theme  Papirus-Dark 2>/dev/null || true
sensors-detect --auto >/dev/null 2>&1 || true

echo ""
info "Done! Next steps:"
echo "  1. Add your ssh key (~/.ssh) - .gitconfig pulls/pushes github/gitlab over ssh"
echo "  2. Log out, then start niri from a tty:  niri-session"
echo "  3. Pick wallpaper + apply palette:  Mod+Shift+W"
