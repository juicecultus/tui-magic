# 🟢 TUI Magic

**A beautiful, lightweight TUI (Text User Interface) environment for low-resource Linux machines.**

Built for an IBM ThinkPad X40 (Pentium M 1.5GHz, 1.5GB RAM, 120GB SSD) running Debian 12 — but works on any Debian/Ubuntu system where you want a gorgeous terminal-only workflow.

![Matrix Green Theme](https://img.shields.io/badge/theme-matrix%20green-00ff41?style=flat-square&labelColor=0a0a0a)
![Debian 12](https://img.shields.io/badge/debian-12%20bookworm-a80030?style=flat-square&logo=debian)
![RAM Usage](https://img.shields.io/badge/idle%20RAM-~300MB-00ff41?style=flat-square&labelColor=0a0a0a)

```
 _____ _    _      _   ___         _  __  ___ _   __  
|_   _| |_ (_)_ _ | |_| _ \__ _ __| | \ \/ / | | /  \ 
  | | | ' \| | ' \| / /  _/ _` / _` |  >  <|_  _| () |
  |_| |_||_|_|_||_|_\_\_| \__,_\__,_| /_/\_\ |_| \__/ 
```

---

## What You Get

A complete terminal-only desktop replacement with **50+ TUI tools**, all themed in a cohesive **matrix-green-on-black** aesthetic. Everything runs inside **tmux** with quick-launch keybindings — no mouse, no GUI, no wasted resources.

### Tools by Category

| Category | Tools | Description |
|----------|-------|-------------|
| **Tiling/Session** | `tmux` | Terminal multiplexer — your "window manager" |
| **System Monitor** | `btop` `htop` `glances` `nmon` `inxi` `neofetch` | CPU, RAM, disk, network, temps |
| **File Manager** | `ranger` `mc` `nnn` | Visual file browsing with previews |
| **Git** | `tig` | Full git TUI — log, diff, blame, staging |
| **Network** | `iftop` `nload` `bmon` `nethogs` `mtr` `speedtest-cli` `nmtui` | Traffic, bandwidth, WiFi config |
| **Audio Visualizer** | `cava` | Real-time audio spectrum with green gradient |
| **Music Player** | `cmus` `mocp` `ncmpcpp`+`mpd` `mpv` | Multiple player options |
| **Text Editor** | `neovim` `micro` | Power user + beginner-friendly editors |
| **Web Browser** | `w3m` `lynx` `elinks` | Terminal web browsing |
| **Email** | `neomutt` `mutt` | Terminal email clients |
| **IRC/Chat** | `irssi` `weechat` | IRC clients |
| **RSS Reader** | `newsboat` | RSS/Atom feed reader (pre-configured feeds) |
| **Calendar/Tasks** | `calcurse` `taskwarrior` `vit` | Scheduling and task management |
| **Search** | `fzf` `ripgrep` `fd-find` `bat` | Fuzzy find, fast grep, better cat |
| **Disk Usage** | `gdu` `duf` `ncdu` | Visual disk analysis |
| **Archives** | `atool` `p7zip-full` `zip` `unzip` | Universal archive handling |
| **Media** | `mpv` `chafa` | Video player, terminal image viewer |
| **Torrents** | `transmission-cli` | Terminal torrent client |
| **Spreadsheet** | `sc` | Terminal spreadsheet |
| **Utilities** | `jq` `colordiff` `pass` `aria2` `bc` | JSON, diffs, passwords, downloads |
| **Eye Candy** | `cmatrix` `tty-clock` `cbonsai` `figlet` `lolcat` | Matrix rain, clocks, ASCII art |

---

## Installation

### Prerequisites

- Debian 12 (Bookworm) or Ubuntu 22.04+ base install
- SSH access or local terminal
- `sudo` privileges

### Quick Install

```bash
git clone https://github.com/juicecultus/tui-magic.git
cd tui-magic
chmod +x install.sh
./install.sh
```

### Manual Install

#### 1. System Optimization (optional, for SSD)

```bash
# Add noatime and discard to fstab for SSD
sudo sed -i 's/errors=remount-ro/noatime,errors=remount-ro,discard/' /etc/fstab

# Reduce swappiness
echo 'vm.swappiness=10' | sudo tee /etc/sysctl.d/99-ssd-tweaks.conf
echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.d/99-ssd-tweaks.conf
sudo sysctl -p /etc/sysctl.d/99-ssd-tweaks.conf

# Cap journal size
sudo mkdir -p /etc/systemd/journald.conf.d
printf '[Journal]\nSystemMaxUse=50M\nMaxRetentionSec=7day\n' | sudo tee /etc/systemd/journald.conf.d/size.conf
sudo systemctl restart systemd-journald
```

#### 2. Install Packages

```bash
sudo apt update
sudo apt install -y \
  tmux cmatrix btop tty-clock cbonsai nnn figlet lolcat ranger mc neovim \
  htop neofetch toilet w3m w3m-img bc acpi sysstat procps \
  tig cava cmus moc ncmpcpp mpd newsboat calcurse ncdu \
  iftop nload bmon nethogs nmon glances \
  irssi weechat lynx elinks chafa pass jq aria2 \
  transmission-cli atool p7zip-full unzip zip inxi sc micro \
  duf gdu taskwarrior vit mutt neomutt mpv \
  fzf bat fd-find ripgrep plocate most colordiff mtr-tiny speedtest-cli \
  network-manager fonts-dejavu fonts-liberation
```

#### 3. Deploy Config Files

```bash
# Tmux
cp .tmux.conf ~/
mkdir -p ~/.tmux
cp tmux/cpu.sh tmux/mem.sh tmux/bat.sh tmux/dashboard.sh tmux/cheatsheet.txt ~/.tmux/
chmod +x ~/.tmux/*.sh

# Shell
cp .bashrc ~/
cp .bash_profile ~/

# Scripts
mkdir -p ~/bin
cp bin/* ~/bin/
chmod +x ~/bin/*

# App configs
mkdir -p ~/.config/{cava,newsboat,calcurse,btop/themes,neofetch,micro}
cp cava/config ~/.config/cava/
cp newsboat/config ~/.config/newsboat/
cp newsboat/urls ~/.config/newsboat/
cp calcurse/conf ~/.config/calcurse/
cp btop/btop.conf ~/.config/btop/
cp btop/themes/matrix.theme ~/.config/btop/themes/
cp neofetch/config.conf ~/.config/neofetch/
cp micro/settings.json ~/.config/micro/
cp tig/.tigrc ~/
```

#### 4. Log Out and Back In

The new `.bash_profile` will auto-display the MOTD and attach to tmux.

---

## Usage

### Getting Started

SSH in (or open a terminal) and you'll see:

```
 _____ _    _      _   ___         _  __  ___ _   __  
|_   _| |_ (_)_ _ | |_| _ \__ _ __| | \ \/ / | | /  \ 
  | | | ' \| | ' \| / /  _/ _` / _` |  >  <|_  _| () |
  |_| |_||_|_|_||_|_\_\_| \__,_\__,_| /_/\_\ |_| \__/ 

  System
  ──────────────────────────────────────────────────
  Uptime   │ 2 hours, 15 minutes
  Load     │ 0.12
  CPU Temp │ 42°C
  Memory   │ 285M / 1495M
  Disk /   │ 4.1G/28G
  IP       │ 192.168.7.31
  ──────────────────────────────────────────────────

  Quick Launch (Ctrl-a prefix)
  ──────────────────────────────────────────────────
  m=matrix  b=btop  n=ranger  t=tig  D=dashboard
  v=cava   M=cmus  c=calcurse R=rss  W=web
  T=clock  B=bonsai g=disk     i=net  w=wifi
  ──────────────────────────────────────────────────
  Ctrl-a ? for full cheatsheet
```

You're now inside **tmux**. Everything is one keybinding away.

### Tmux Keybindings

The prefix key is **`Ctrl-a`** (press Ctrl+a, release, then press the shortcut key).

#### Window Management

| Key | Action |
|-----|--------|
| `Ctrl-a \|` | Split pane horizontally |
| `Ctrl-a -` | Split pane vertically |
| `Ctrl-a h/j/k/l` | Navigate panes (vim-style) |
| `Ctrl-a H/J/K/L` | Resize panes |
| `Ctrl-a c` | New window |
| `Ctrl-a 1-9` | Switch to window N |
| `Ctrl-a x` | Close current pane |
| `Ctrl-a d` | Detach (session keeps running) |
| `Ctrl-a r` | Reload tmux config |

#### Quick Launch Apps

| Key | App | Description |
|-----|-----|-------------|
| `Ctrl-a m` | `cmatrix` | Matrix digital rain screensaver |
| `Ctrl-a T` | `tty-clock` | Beautiful terminal clock |
| `Ctrl-a B` | `cbonsai` | Animated bonsai tree |
| `Ctrl-a D` | Dashboard | Split layout: neofetch + btop + cmatrix + cava |
| `Ctrl-a b` | `btop` | System monitor (matrix themed) |
| `Ctrl-a g` | `gdu` | Disk usage analyzer |
| `Ctrl-a n` | `ranger` | File manager |
| `Ctrl-a N` | `nnn` | Lightweight file manager |
| `Ctrl-a t` | `tig` | Git TUI |
| `Ctrl-a i` | `iftop` | Network traffic monitor |
| `Ctrl-a w` | `nmtui` | WiFi network manager |
| `Ctrl-a v` | `cava` | Audio spectrum visualizer |
| `Ctrl-a M` | `cmus` | Music player |
| `Ctrl-a c` | `calcurse` | Calendar & scheduling |
| `Ctrl-a R` | `newsboat` | RSS feed reader |
| `Ctrl-a W` | `w3m` | Web browser (DuckDuckGo) |
| `Ctrl-a ?` | Cheatsheet | Full keybinding reference |

### Shell Aliases

All aliases are available directly in the shell:

#### Core

| Alias | Command | Description |
|-------|---------|-------------|
| `ll` | `ls -lah` | Long listing |
| `la` | `ls -A` | Show hidden files |
| `cat` | `batcat` | Syntax-highlighted cat |
| `find` | `fdfind` | Fast file finder |
| `rg` | `ripgrep` | Fast grep |
| `diff` | `colordiff` | Colorized diffs |
| `df` | `duf` | Beautiful disk free |
| `du` | `gdu` | Interactive disk usage |

#### System

| Alias | Description |
|-------|-------------|
| `mon` / `top` | Open btop system monitor |
| `nf` | Neofetch system info |
| `sys` | Detailed system info (inxi) |
| `temps` | CPU temperature |
| `psmem` | Top processes by RAM |
| `pscpu` | Top processes by CPU |

#### Git

| Alias | Description |
|-------|-------------|
| `g` | git |
| `gs` | git status (short) |
| `gl` | git log (oneline, last 20) |
| `gd` | git diff |
| `ga` | git add |
| `gc` | git commit |
| `gp` | git push |
| `gpl` | git pull |
| `gt` | tig (git TUI) |
| `gb` | tig blame |

#### Network

| Alias | Description |
|-------|-------------|
| `myip` | Show external IP |
| `speed` | Speedtest |
| `net` | iftop traffic monitor |
| `netstat` | nethogs per-process |
| `wifi` | nmtui WiFi manager |
| `trace` | mtr traceroute |

#### Media

| Alias | Description |
|-------|-------------|
| `music` | cmus music player |
| `vis` | cava audio visualizer |
| `play <file>` | mpv audio playback |

#### Productivity

| Alias | Description |
|-------|-------------|
| `cal` | calcurse calendar |
| `task` | taskwarrior |
| `rss` | newsboat RSS reader |
| `mail` | neomutt email |
| `web` | w3m browser |
| `edit` | neovim |
| `e` | micro (simple editor) |
| `calc` | bc calculator |
| `weather` | Current weather |
| `cheat <cmd>` | Cheat sheet for any command |

#### Files & Archives

| Alias | Description |
|-------|-------------|
| `fm` | ranger file manager |
| `n` | nnn file manager |
| `mc` | Midnight Commander |
| `ncdu` | ncdu disk usage |
| `extract <file>` | Auto-extract any archive |
| `compress <file>` | Auto-compress |

#### Eye Candy

| Alias | Description |
|-------|-------------|
| `matrix` | Matrix digital rain |
| `clock` | Terminal clock |
| `bonsai` | Growing bonsai tree |

### Tmux Status Bar

The bottom bar shows real-time system metrics:

```
┃ main ┃ debian-ibm-x40 ┃   1:bash   2:monitor   ┃ CPU:12% │ RAM:285M(19%) │ BAT:=100% ┃ 14:30 ┃
```

- **Left**: Session name + hostname
- **Center**: Window tabs (green = active)
- **Right**: CPU%, RAM usage, battery status, clock

### Dashboard Mode

Press `Ctrl-a D` for a 4-pane dashboard:

```
┌──────────────────┬──────────────────┐
│                  │                  │
│    neofetch +    │      btop        │
│     shell        │  (system stats)  │
│                  │                  │
├──────────────────┼──────────────────┤
│                  │                  │
│    cmatrix       │   cava / clock   │
│  (eye candy)     │  (audio/time)    │
│                  │                  │
└──────────────────┴──────────────────┘
```

---

## File Structure

```
tui-magic/
├── .tmux.conf              # Tmux config — matrix theme, keybindings, status bar
├── .bashrc                 # Shell config — prompt, 60+ aliases, fzf, env vars
├── .bash_profile           # Login config — MOTD display, bashrc sourcing
├── .gitignore
├── install.sh              # Automated installer
│
├── tmux/
│   ├── cpu.sh              # Status bar: CPU usage %
│   ├── mem.sh              # Status bar: RAM usage
│   ├── bat.sh              # Status bar: Battery status
│   ├── dashboard.sh        # Dashboard split layout launcher
│   └── cheatsheet.txt      # Full keybinding reference (Ctrl-a ?)
│
├── bin/
│   ├── motd                # Login banner with system info
│   ├── dashboard           # Standalone dashboard launcher
│   └── screensaver         # cmatrix idle screensaver trigger
│
├── btop/
│   ├── btop.conf           # btop config
│   └── themes/
│       └── matrix.theme    # Custom matrix-green btop theme
│
├── cava/
│   └── config              # Audio visualizer — green gradient
│
├── tig/
│   └── .tigrc              # Git TUI — green-on-black theme
│
├── newsboat/
│   ├── config              # RSS reader — green theme, vim keys
│   └── urls                # Starter RSS feeds (tech/linux)
│
├── calcurse/
│   └── conf                # Calendar config
│
├── neofetch/
│   └── config.conf         # System info display config
│
└── micro/
    └── settings.json       # Micro editor settings
```

---

## Theme

Everything uses a cohesive **Matrix Green** palette:

| Element | Color | Hex |
|---------|-------|-----|
| Primary (text, borders) | Bright green | `#00ff41` |
| Secondary | Medium green | `#00aa22` |
| Accent | Dark green | `#0d2b0d` |
| Background | Near-black | `#0a0a0a` |
| Inactive | Dim gray | `#555555` |
| Alert | Red | `#e94560` |

---

## System Optimizations Included

For SSD-equipped low-resource machines:

- **`noatime` + `discard`** on all mount points (reduces SSD writes)
- **`vm.swappiness=10`** (prefer RAM over swap)
- **`vm.vfs_cache_pressure=50`** (keep directory cache longer)
- **Journald capped** at 50MB / 7 days
- **Unnecessary services disabled** (Bluetooth, ModemManager, etc.)
- **`multi-user.target`** as default (no GUI overhead)

---

## Target Hardware

Originally built for:

| Spec | Value |
|------|-------|
| **Machine** | IBM ThinkPad X40 |
| **CPU** | Intel Pentium M 1.50GHz (single core) |
| **RAM** | 1.5GB DDR |
| **Storage** | 120GB SSD |
| **Display** | 12.1" 1024x768 |
| **GPU** | Intel 852/855GM |
| **WiFi** | Intel PRO/Wireless 2200BG |
| **OS** | Debian 12 Bookworm (i386) |

**Idle resource usage**: ~300MB RAM, 0% swap — leaving over 1.2GB free for actual work.

Works equally well on any modern machine as a minimalist terminal workflow.

---

## License

MIT — do whatever you want with it.

---

*"There is no spoon."*
