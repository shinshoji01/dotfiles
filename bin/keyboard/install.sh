# the directory of qmk_firmware
QMK_DIR="$HOME/Git/qmk_firmware"

# git
sudo apt -y install git

# git clone
git clone https://github.com/shinshoji01/qmk_firmware.git ${QMK_DIR}

# qmk firmware
cd ${QMK_DIR}
git pull origin master
./util/qmk_install.sh
make git-submodule
