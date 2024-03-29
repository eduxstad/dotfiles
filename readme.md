# dotfiles
My personal configuration files and snippets for vim, neovim, LunarVim, and oh-my-zsh.

### Installation
Make sure the programs themselves are installed.

#### ZSH Plugins/Themes
Install the needed ZSH plugins and themes to the relevant `.oh-my-zsh` directories. If using Arch Linux, check for the existance of AUR packages before manual install. 

For example: (repeat for each plugin)
```
$ git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```
```
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

#### Install Packer for neovim
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
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
