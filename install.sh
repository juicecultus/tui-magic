#!/bin/bash
# ══════════════════════════════════════════════
#  TUI Magic — Installer
#  Beautiful TUI environment for low-resource Linux
# ══════════════════════════════════════════════

set -e

GREEN='\e[38;5;46m'
DIM='\e[38;5;240m'
RESET='\e[0m'
BOLD='\e[1m'

info()  { echo -e "${GREEN}[+]${RESET} $1"; }
dim()   { echo -e "${DIM}    $1${RESET}"; }

echo ""
echo -e "${GREEN}${BOLD}  TUI Magic Installer${RESET}"
echo -e "${DIM}  Beautiful TUI environment for low-resource Linux${RESET}"
echo ""

# Check we're on Debian/Ubuntu
if ! command -v apt &>/dev/null; then
    echo "Error: This installer requires apt (Debian/Ubuntu)."
    exit 1
fi

# ── Step 1: Install packages ──
info "Installing TUI packages (this may take a while)..."
sudo apt update -qq

sudo DEBIAN_FRONTEND=noninteractive apt install -y \
  tmux cmatrix btop tty-clock cbonsai nnn figlet lolcat ranger mc neovim \
  htop neofetch toilet w3m w3m-img bc acpi sysstat procps \
  tig cava cmus moc ncmpcpp mpd newsboat calcurse ncdu \
  iftop nload bmon nethogs nmon glances \
  irssi weechat lynx elinks chafa pass jq aria2 \
  transmission-cli atool p7zip-full unzip zip inxi sc micro \
  duf gdu taskwarrior vit mutt neomutt mpv \
  fzf bat fd-find ripgrep plocate most colordiff mtr-tiny speedtest-cli \
  network-manager fonts-dejavu fonts-liberation 2>&1 | tail -3

info "Packages installed."

# ── Step 2: Deploy config files ──
info "Deploying config files..."

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Tmux
cp "$SCRIPT_DIR/.tmux.conf" ~/
mkdir -p ~/.tmux
cp "$SCRIPT_DIR/tmux/cpu.sh" "$SCRIPT_DIR/tmux/mem.sh" "$SCRIPT_DIR/tmux/bat.sh" \
   "$SCRIPT_DIR/tmux/dashboard.sh" "$SCRIPT_DIR/tmux/cheatsheet.txt" ~/.tmux/
chmod +x ~/.tmux/*.sh
dim "tmux config + status bar scripts"

# Shell
cp "$SCRIPT_DIR/.bashrc" ~/
cp "$SCRIPT_DIR/.bash_profile" ~/
dim "bash config + prompt"

# Scripts
mkdir -p ~/bin
cp "$SCRIPT_DIR/bin/"* ~/bin/
chmod +x ~/bin/*
dim "utility scripts (motd, dashboard, screensaver)"

# App configs
mkdir -p ~/.config/{cava,newsboat,calcurse,btop/themes,neofetch,micro}

cp "$SCRIPT_DIR/cava/config" ~/.config/cava/
dim "cava (audio visualizer)"

cp "$SCRIPT_DIR/tig/.tigrc" ~/
dim "tig (git TUI)"

cp "$SCRIPT_DIR/newsboat/config" ~/.config/newsboat/
cp "$SCRIPT_DIR/newsboat/urls" ~/.config/newsboat/
dim "newsboat (RSS reader)"

cp "$SCRIPT_DIR/calcurse/conf" ~/.config/calcurse/
dim "calcurse (calendar)"

cp "$SCRIPT_DIR/btop/btop.conf" ~/.config/btop/
cp "$SCRIPT_DIR/btop/themes/matrix.theme" ~/.config/btop/themes/
dim "btop (system monitor + matrix theme)"

cp "$SCRIPT_DIR/neofetch/config.conf" ~/.config/neofetch/
dim "neofetch (system info)"

cp "$SCRIPT_DIR/micro/settings.json" ~/.config/micro/
dim "micro (editor)"

info "Config files deployed."

# ── Step 3: Optional SSD optimization ──
echo ""
read -p "$(echo -e "${GREEN}[?]${RESET} Apply SSD optimizations (noatime, swappiness)? [y/N] ")" ssd_opt
if [[ "$ssd_opt" =~ ^[Yy]$ ]]; then
    # Swappiness
    echo 'vm.swappiness=10' | sudo tee /etc/sysctl.d/99-ssd-tweaks.conf >/dev/null
    echo 'vm.vfs_cache_pressure=50' | sudo tee -a /etc/sysctl.d/99-ssd-tweaks.conf >/dev/null
    sudo sysctl -p /etc/sysctl.d/99-ssd-tweaks.conf >/dev/null
    dim "swappiness=10, vfs_cache_pressure=50"

    # Journald
    sudo mkdir -p /etc/systemd/journald.conf.d
    printf '[Journal]\nSystemMaxUse=50M\nMaxRetentionSec=7day\n' | sudo tee /etc/systemd/journald.conf.d/size.conf >/dev/null
    sudo systemctl restart systemd-journald
    dim "journald capped at 50MB / 7 days"

    info "SSD optimizations applied."
    echo -e "${DIM}    Note: Add 'noatime,discard' to /etc/fstab manually for mount opts.${RESET}"
fi

# ── Done ──
echo ""
echo -e "${GREEN}${BOLD}  ✓ TUI Magic installed!${RESET}"
echo ""
echo -e "${DIM}  Log out and back in to activate.${RESET}"
echo -e "${DIM}  Or run: source ~/.bashrc${RESET}"
echo -e "${DIM}  Then:   tmux${RESET}"
echo ""
echo -e "${DIM}  Press Ctrl-a ? inside tmux for the full cheatsheet.${RESET}"
echo ""
