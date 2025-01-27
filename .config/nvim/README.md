# AstroNvim Template

**NOTE:** This is for AstroNvim v4+

A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

### Modifications
[x] Autocommand to close neo-tree on BufEnter
[x] Add AstroReload command
[x] Add normal mode mapping "<Tab>" to move to next buffer ("<C-w>w")
[x] Enable spell and spelllang "en"
[x] Turn on line wrap
[x] lvim ToggleTerm mappings (for compatibility with tenkeyless)
[x] Avante

### Todo
[] Open PR to update astrovim documentation for terminal toggle
