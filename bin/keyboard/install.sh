# the directory of qmk_firmware
QMK_DIR="$HOME/Git/qmk_firmware"

# git
sudo apt -y install git

# Git clone
if [ -d "$QMK_DIR" ]; then
  cd $QMK_DIR
  git pull origin main
else
  git clone https://github.com/shinshoji01/qmk_firmware.git ${QMK_DIR}
fi

# install some dependencies
pip3 install wheel

# qmk firmware
brew install qmk/qmk/qmk
cd ${QMK_DIR}
git pull origin master
./util/qmk_install.sh
make git-submodule
qmk setup
