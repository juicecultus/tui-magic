# 🎮 TUI Magic — Beginner's Guide

**How to use your ThinkPad X40 TUI environment, explained simply.**

---

## Think of it Like a TV Remote

Your ThinkPad terminal works like a TV with **channels**. Each channel is a different app (music player, file browser, system monitor, etc.). The **remote control button** is:

### **Ctrl-a** = The Magic Button

This means: **hold the `Ctrl` key and press `a`**, then **let go of both**, then press the next key.

It's always a **two-step** action:
1. **Press `Ctrl-a`** (hold Ctrl, tap a, release both)
2. **Then press the shortcut key** (like `m` for matrix)

---

## Try These Right Now

### See the Matrix rain
1. Press **`Ctrl-a`** then **`m`**
2. Enjoy the green rain! Press **`q`** to stop it.

### See your system stats
1. Press **`Ctrl-a`** then **`b`**
2. You'll see CPU, RAM, disk usage. Press **`q`** to go back.

### Browse your files
1. Press **`Ctrl-a`** then **`n`**
2. Use **arrow keys** to move around, **Enter** to open, **`q`** to quit.

### See a cool clock
1. Press **`Ctrl-a`** then **`T`** (capital T — hold Shift and press t)
2. Press **`q`** to quit.

### Grow a bonsai tree
1. Press **`Ctrl-a`** then **`B`** (capital B — hold Shift and press b)
2. Press **`q`** to quit.

### Audio visualizer
1. Press **`Ctrl-a`** then **`v`**
2. Shows music bars if audio is playing. Press **`q`** to quit.

### Open the cheatsheet (list of ALL shortcuts)
1. Press **`Ctrl-a`** then **`?`** (hold Shift and press /)
2. Scroll with arrow keys. Press **`q`** to close.

---

## Switching Between "Channels" (Windows)

Every time you launch something, it opens in a new **window** (like a TV channel). You'll see them listed at the bottom of the screen:

```
  1:bash   2:matrix   3:monitor   4:files
```

- **`Ctrl-a`** then **`1`** = go to window 1
- **`Ctrl-a`** then **`2`** = go to window 2
- **`Ctrl-a`** then **`3`** = go to window 3
- ...and so on

---

## Split Screen (Two Apps Side-by-Side)

- **`Ctrl-a`** then **`|`** (pipe key, usually Shift + backslash `\`) = split left/right
- **`Ctrl-a`** then **`-`** (minus key) = split top/bottom
- **`Ctrl-a`** then **`h`/`j`/`k`/`l`** = move between split panes (left/down/up/right)
- **`Ctrl-a`** then **`x`** = close the current pane

---

## Quick Shell Commands (Just Type These)

You can also just **type these words** at the prompt and press Enter:

| Type this | What happens |
|-----------|-------------|
| `matrix` | Matrix green rain |
| `clock` | Big terminal clock |
| `bonsai` | Growing bonsai tree |
| `mon` | System monitor |
| `fm` | File browser |
| `music` | Music player |
| `vis` | Audio visualizer |
| `weather` | Current weather |
| `nf` | Show system info art |
| `web` | Web browser |
| `wifi` | WiFi settings |
| `rss` | News reader |
| `cal` | Calendar |
| `e filename` | Edit a file (simple editor) |

---

## How to Exit / Go Back

- **`q`** = quit most apps
- **`Ctrl-c`** = force-stop anything
- **`Ctrl-a`** then **`d`** = **detach** from tmux (everything keeps running, you can come back by typing `t`)
- Type **`exit`** = close the current terminal

---

## All Ctrl-a Shortcuts at a Glance

### Eye Candy
| Press | Opens |
|-------|-------|
| `Ctrl-a m` | Matrix screensaver |
| `Ctrl-a T` | Terminal clock |
| `Ctrl-a B` | Bonsai tree |
| `Ctrl-a D` | Full dashboard (all at once) |

### System
| Press | Opens |
|-------|-------|
| `Ctrl-a b` | System monitor (btop) |
| `Ctrl-a g` | Disk usage (gdu) |

### Files
| Press | Opens |
|-------|-------|
| `Ctrl-a n` | File manager (ranger) |
| `Ctrl-a N` | File manager (nnn) |

### Git
| Press | Opens |
|-------|-------|
| `Ctrl-a t` | Git browser (tig) |

### Network
| Press | Opens |
|-------|-------|
| `Ctrl-a i` | Network traffic monitor |
| `Ctrl-a w` | WiFi manager |

### Media
| Press | Opens |
|-------|-------|
| `Ctrl-a v` | Audio visualizer (cava) |
| `Ctrl-a M` | Music player (cmus) |

### Productivity
| Press | Opens |
|-------|-------|
| `Ctrl-a c` | Calendar (calcurse) |
| `Ctrl-a R` | RSS news reader |
| `Ctrl-a W` | Web browser |

### Tmux Basics
| Press | Does |
|-------|------|
| `Ctrl-a \|` | Split screen left/right |
| `Ctrl-a -` | Split screen top/bottom |
| `Ctrl-a h/j/k/l` | Move between panes |
| `Ctrl-a 1-9` | Switch window |
| `Ctrl-a c` | New window |
| `Ctrl-a x` | Close pane |
| `Ctrl-a d` | Detach (leave running) |
| `Ctrl-a r` | Reload config |
| `Ctrl-a ?` | Show full cheatsheet |

---

## The One Rule

> **`Ctrl-a` is the magic prefix. Press it first, then press the shortcut key.**

That's it! Start with `Ctrl-a m` to see the Matrix rain, then explore from there.
