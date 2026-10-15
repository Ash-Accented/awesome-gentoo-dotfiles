<div align="center">
  
# dotfiles

My heavily customized Gentoo Linux setup, featuring:

- Awesome WM config in Lua, with [awesome-modalbind](https://github.com/crater2150/awesome-modalbind) for modal keybinds and [lain](https://github.com/lcpz/lain) for widgets
- Portage USE/keyword/license files, plus `world` and `world_sets` snapshots
- Bash/awk automation scripts, including EDID-based monitor detection and keybind-driven resolution switching for multi-monitor setups

![showcase](https://github.com/user-attachments/assets/4f09770d-73f2-4884-9c68-9c0a29d253bf)

</div>

## Layout

| Repo path       | System location                                   |
|-----------------|---------------------------------------------------|
| `gentoo/`       | `/etc/portage/` (excluding `world*`)              |
| `gentoo/world*` | `/var/lib/portage/world`, `world_sets` (snapshot only, not deployed) |
| `scripts/`      | `~/.local/bin/`                                   |
| `shell/bashrc`  | `~/.bashrc`                                       |
| `awesome/`      | `~/.config/awesome/`                              |

## Setup

```bash
git clone --recurse-submodules https://github.com/Ash-Accented/dotfiles.git
```

- `gentoo/package.use/00cpu-flags` is hardware-specific. Regenerate it with `cpuid2cpuflags` on other hardware.
- `awesome/themes/default/wallpapers/` ships only `sel_ref_5.jpeg`. Add your own images there.
- `scripts/bluetooth_management.sh` reads your device's MAC address from `~/.config/bluetooth/bt_headphones`. Create that file yourself with the text for your MAC Address.
- `bashrc` references `deno` and `cargo` paths, it isn't necessary to keep and can be omitted if preferred 

## Credits

Theme based on Powerarrow Dark by [lcpz](https://github.com/lcpz).
