# the directory of qmk_firmware
QMK_DIR="$HOME/Git/qmk_firmware"

# qmk firmware
cd ${QMK_DIR}
git pull origin master
qmk compile -kb 7skb -km sho-7skb_mac
qmk flash -kb 7skb -km sho-7skb_mac
