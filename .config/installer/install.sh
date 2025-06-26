echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> ~/.zshrc && \
source ~/.zshrc && \
git clone --bare <your-repo-url> $HOME/.dotfiles && \
dotfiles checkout
