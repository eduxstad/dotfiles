# dotfiles
My personal configuration files and snippets for vim, neovim, LunarVim, and oh-my-zsh.

### Installation
Make sure the programs themselves are installed.

#### ZSH Plugins/Themes
Install the needed ZSH plugins and themes to the relevant `.oh-my-zsh` directories

For example (repeat for each plugin)
```
$ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```
```
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
#### Softlink the config files/directories
```
$ cd
$ ln -s ~/Git/dotfiles/.zshrc .zshrc
$ ln -s ~/Git/dotfiles/.vimrc .vimrc
$ cd .config
$ ln -s ~/Git/dotfiles/.config/lvim/ lvim
$ ln -s ~/Git/dotfiles/.config/nvim/ nvim
```
