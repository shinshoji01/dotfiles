# installation of python revisers
pip3 install flake8
pip3 install pep8

# installation of peco
sudo apt  install peco

# dotfiles' dir
DOT_DIR="$HOME/Git/dotfiles"
#DOT_DIR="/work"

# git
sudo apt -y install git

# tmux
sudo apt -y install tmux

# fish
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:fish-shell/release-3
sudo apt-get install -y fish fzf
fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"

# fisher
fish -c "fisher install \
                        oh-my-fish/plugin-balias \
                        oh-my-fish/theme-bobthefish \
                        jethrokuan/z \
                        oh-my-fish/plugin-peco \
                        jethrokuan/fzf"

# Git clone
if [ -d "$DOT_DIR" ]; then
  cd $DOT_DIR
  git pull origin main
else
  git clone https://github.com/shinshoji01/dotfiles.git ${DOT_DIR}
fi

# NeoBundle
mkdir ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# copy on vim -> clipboard
sudo apt install -y vim-gtk3

# ----------------------------------------------------------------------------------------- #
# symbolic link

## vim
ln -sf ${DOT_DIR}/vim/.vimrc ~/.vimrc

# tmux
ln -sf ${DOT_DIR}/tmux/.tmux_conf ~/.tmux.conf

# fish
mkdir -p ~/.config/fish/functions
ln -sf ${DOT_DIR}/fish/config.fish ~/.config/fish/config.fish
ln -sf ${DOT_DIR}/fish/functions/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
