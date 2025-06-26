git clone --bare https://github.com/Shabani005/dotfiles.git "$HOME/.dotfiles" && \
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> "$HOME/.zshrc" && \
source "$HOME/.zshrc" && \
dotfiles checkout
