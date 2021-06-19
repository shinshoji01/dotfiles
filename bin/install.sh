# installation of python revisers
pip3 install flake8
pip3 install pep8

# git
sudo apt -y install git

# tmux
sudo apt -y install tmux

# fish
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:fish-shell/release-3
sudo apt-get install -y fish
exec fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

## fisher
fisher install oh-my-fish/plugin-balias
fisher install oh-my-fish/theme-bobthefish
fisher install jethrokuan/z
fisher install oh-my-fish/plugin-peco
fisher install jethrokuan/fzf
exec bash
