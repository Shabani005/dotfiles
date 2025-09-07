# echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> ~/.bashrc && \
# source ~/.bashrc && \
git clone --bare  https://github.com/Shabani005/dotfiles.git $HOME/.dotfiles && \
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
