<div align="center">
	
# awesome-gentoo-dotfiles


**My heavily customized Gentoo Linux setup, featuring:**

![showcase](https://github.com/user-attachments/assets/4f09770d-73f2-4884-9c68-9c0a29d253bf)

![showcase](https://github.com/user-attachments/assets/a323c614-c46a-45cb-a125-dfba5f9f282b)
</div>

- Awesome WM config in Lua, with [awesome-modalbind](https://github.com/crater2150/awesome-modalbind) for modal keybinds and [lain](https://github.com/lcpz/lain) for widgets
- Portage USE/keyword/license files, plus `world` and `world_sets` snapshots
- Bash/awk automation scripts, including EDID-based monitor detection and keybind-driven resolution switching for multi-monitor setups

<div align="center">

## Layout

</div>

| Repo path       | System location                                   |
|-----------------|---------------------------------------------------|
| `gentoo/`       | `/etc/portage/` (excluding `world*`)              |
| `gentoo/world*` | `/var/lib/portage/world`, `world_sets` (snapshot only, not deployed) |
| `scripts/`      | `~/.local/bin/`                                   |
| `shell/bashrc`  | `~/.bashrc`                                       |
| `awesome/`      | `~/.config/awesome/`                              |

<div align="center">

## Setup

</div>

```bash
git clone --recurse-submodules https://github.com/Ash-Accented/dotfiles.git
```

- `gentoo/package.use/00cpu-flags` is hardware-specific. Regenerate it with `cpuid2cpuflags` on other hardware.
- `awesome/themes/default/wallpapers/` only uses a Serial Experiments Lain image for a default wallpaper w/ filename `sel_ref_5.jpeg`. Add your own images all you want!
- `scripts/bluetooth_management.sh` reads your device's MAC address from `~/.config/bluetooth/bt_headphones`. Create that file yourself with the text for your MAC Address, or set up a variable with your MAC Address in the script!
- `bashrc` references `deno` and `cargo` paths, it isn't necessary to keep and can be omitted if preferred!

<div align="center">

## Credits

</div>

Theme based on Powerarrow Dark by [lcpz](https://github.com/lcpz).
