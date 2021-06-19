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
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

## fisher
fish -c "fisher install \
                        oh-my-fish/plugin-balias \
                        oh-my-fish/theme-bobthefish \
                        jethrokuan/z \
                        oh-my-fish/plugin-peco \
                        jethrokuan/fzf"
