# dotfiles
## Installation
- To make my environment
```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/shinshoji01/dotfiles/main/bin/install.sh)"
```

## For ubuntu
### Tilix
- install tilix
```bash
sudo apt update
sudo apt install tilix
```
- make your window full-sized
```bash
gsettings set com.gexperts.Tilix.Settings quake-height-percent 100
```

### Keyboard Shortcut
- run tilix
  - command: `shift` + `space`
  - hotkey: `tilix --quake`

## Switch Keyboard
- for mac
```bash
bash -c "$(https://raw.githubusercontent.com/shinshoji01/dotfiles/main/bin/keyboard/switch_mac.sh)"
```
- for ubuntu
```bash
bash -c "$(https://raw.githubusercontent.com/shinshoji01/dotfiles/main/bin/keyboard/switch_ubuntu.sh)"
```
