# the directory of qmk_firmware
QMK_DIR="$HOME/Git/qmk_firmware"

# qmk firmware
cd ${QMK_DIR}
git pull origin master
qmk compile -kb 7skb -km sho-7skb_ubuntu
qmk flash -kb 7skb -km sho-7skb_ubuntu