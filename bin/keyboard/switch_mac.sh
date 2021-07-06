# the directory of qmk_firmware
QMK_DIR="$HOME/Git/qmk_firmware"

# qmk firmware
cd ${QMK_DIR}
git pull origin master
qmk compile -kb crkbd -km sho-crkbd
qmk flash -kb crkbd -km sho-crkbd
