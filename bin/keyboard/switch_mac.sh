# dotfiles' dir
DOT_DIR="$HOME/Git/qmk_firmware"

# git
sudo apt -y install git

# git clone
git clone https://github.com/shinshoji01/qmk_firmware.git ${DOT_DIR}

# qmk firmware
cd ${DOT_DIR}
qmk compile -kb 7skb -km sho-7skb 
qmk flash -kb 7skb -km sho-7skb
