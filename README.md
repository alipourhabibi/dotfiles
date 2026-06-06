## dotfiles

Wayland desktop setup for Arch Linux.

- **niri** - compositor
- **waybar** - bottom bar
- **rofi** - launcher + wallpaper picker
- **mako** - notifications
- **ghostty** - terminal
- **nvim** - editor
- **gtk-3.0 / gtk-4.0** - dark theme settings

Colors are generated dynamically from the wallpaper using [matugen](https://github.com/InioX/matugen) (Material You).
Waybar, rofi, mako, and the niri focus ring all update on wallpaper change (`Mod+Shift+W`).

### Setup

```bash
./init.sh
```

Installs packages, copies configs, applies dark mode. After first login, press `Mod+Shift+W` to pick a wallpaper and apply the color palette.
