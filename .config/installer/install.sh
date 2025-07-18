echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> ~/.zshrc && \
source ~/.zshrc && \
git clone --bare  https://github.com/Shabani005/dotfiles.git $HOME/.dotfiles && \
dotfiles checkout
