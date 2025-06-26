echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> ~/.bashrc && \
source ~/.bashrc && \
git clone --bare <your-repo-url> $HOME/.dotfiles && \
dotfiles checkout
