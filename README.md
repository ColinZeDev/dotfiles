# My Awesome Dotfiles for Arch Linux
### BSPWM
![bspwm](https://raw.githubusercontent.com/ColinZeDev/dotfiles/refs/heads/main/BSPWM_2026-04-23_184620_Thu.png)

---

### Info
- Hardare: [Lenovo ThinkPad X1 Carbon Gen 8](https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadx1/22tp2x1x1c8/22tp2x1x1c8)
    - CPU: Intel Core i7-10610U
    - Graphics: Integrated
    - RAM: 16GB LPDDR3-2133
    - Screen: 1920x1080@60hz
    - Storage: 256GB NVMe SSD
- Bootloader: Limine
- Kernel: Linux LTS (might switch to zen)
- OS: Arch Linux (btw)
- Shell: Z Shell (zsh)
- Network Config: NetworkManager (iwd backend)
- Greeter: EmpTTY
- Display Manager: X11
- Audio Server: PipeWire
- DE/WM: BSPWM
- Hotkey Daemon: sxhkd
- Status Bar: polybar
- Compositor: picom
- App Launcher: rofi
- Browser: LibreWolf
- Terminal: Kitty
- File Manager: Thunar
- Code Editor: Visual Studio Code
- Screenshot tool: flameshot<br>
(let me know if i missed something here)

---

#### Install

**curl:**
```sh
curl -fsSL https://raw.githubusercontent.com/ColinZeDev/dotfiles/refs/heads/main/_installdotfiles.sh | bash
```

**wget:**
```sh
wget -qO- https://raw.githubusercontent.com/ColinZeDev/dotfiles/refs/heads/main/_installdotfiles.sh | bash
```

#### Manual Install
```sh
git clone https://github.com/ColinZeDev/dotfiles.git
cd dotfiles
bash _installdotfiles.sh
```
