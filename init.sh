#!/usr/bin/env bash
# init.sh - bootstrap dotfiles on a fresh Arch Linux install
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

G='\033[0;32m'; Y='\033[1;33m'; R='\033[0;31m'; N='\033[0m'
info()  { echo -e "${G}[+]${N} $*"; }
warn()  { echo -e "${Y}[!]${N} $*"; }
error() { echo -e "${R}[✗]${N} $*"; exit 1; }

info "Creating directories..."
mkdir -p \
    "$HOME/.config/niri" \
    "$HOME/.config/waybar" \
    "$HOME/.config/rofi" \
    "$HOME/.config/mako" \
    "$HOME/.config/gtk-3.0" \
    "$HOME/.config/gtk-4.0" \
    "$HOME/.config/wallpapers" \
    "$HOME/Pictures/Screenshots"

PACMAN_PKGS=(
    # Compositor & bar
    niri
    waybar
    # Notifications
    mako
    libnotify
    # Launcher
    rofi-wayland
    # Wallpaper & lock
    swaybg
    swaylock
    # Terminal
    ghostty
    # Tray & clipboard
    network-manager-applet
    wl-clipboard
    cliphist
    # Media & audio
    pipewire
    pipewire-pulse
    wireplumber
    playerctl
    # Brightness
    brightnessctl
    # Sensors
    lm_sensors
    # Portal (screenshots, file pickers)
    xdg-desktop-portal-gnome
    xdg-desktop-portal
    # Python (palette scripts)
    python
    # Fonts
    ttf-jetbrains-mono-nerd
    noto-fonts
    noto-fonts-emoji
    # Icons
    papirus-icon-theme
    # Misc
    polkit-gnome
)

info "Installing pacman packages..."
sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"

AUR_PKGS=(
    matugen       # Material You color extractor
    clipit        # clipboard history (optional, used in niri autostart)
)

AUR_HELPER=""
for h in yay paru; do
    command -v "$h" &>/dev/null && { AUR_HELPER="$h"; break; }
done

if [[ -n "$AUR_HELPER" ]]; then
    info "Installing AUR packages via $AUR_HELPER..."
    "$AUR_HELPER" -S --needed --noconfirm "${AUR_PKGS[@]}"
else
    warn "No AUR helper (yay/paru) found. Install manually: ${AUR_PKGS[*]}"
fi

info "Copying configs..."

cp_() {
    local src="$DOTFILES/$1" dst="$2"
    [[ -f "$src" ]] || { warn "Missing: $src - skipping"; return; }
    cp "$src" "$dst"
    echo "  $1 → $dst"
}

# niri
cp_ niri/config.kdl            "$HOME/.config/niri/config.kdl"
cp_ niri/wallpaper-picker      "$HOME/.config/niri/wallpaper-picker"
cp_ niri/volume-osd            "$HOME/.config/niri/volume-osd"
cp_ niri/brightness-osd        "$HOME/.config/niri/brightness-osd"
chmod +x \
    "$HOME/.config/niri/wallpaper-picker" \
    "$HOME/.config/niri/volume-osd" \
    "$HOME/.config/niri/brightness-osd"

# waybar
cp_ waybar/config.jsonc         "$HOME/.config/waybar/config.jsonc"
cp_ waybar/style.css            "$HOME/.config/waybar/style.css"
cp_ waybar/style.template.css   "$HOME/.config/waybar/style.template.css"

# rofi
cp_ rofi/config.rasi            "$HOME/.config/rofi/config.rasi"
cp_ rofi/colors.rasi            "$HOME/.config/rofi/colors.rasi"

# mako
cp_ mako/config                 "$HOME/.config/mako/config"
cp_ mako/config.template        "$HOME/.config/mako/config.template"

# GTK
cp_ gtk-3.0/settings.ini        "$HOME/.config/gtk-3.0/settings.ini"
cp_ gtk-4.0/settings.ini        "$HOME/.config/gtk-4.0/settings.ini"

info "Applying dark mode..."
gsettings set org.gnome.desktop.interface color-scheme prefer-dark 2>/dev/null || true
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark   2>/dev/null || true

info "Detecting sensors..."
sudo sensors-detect --auto 2>/dev/null || true

echo ""
info "Done! Next steps:"
echo "  1. Add wallpapers to ~/.config/wallpapers/"
echo "  2. Start niri:  niri-session  (or select it from your display manager)"
echo "  3. Pick wallpaper + apply palette:  Mod+Shift+W"
