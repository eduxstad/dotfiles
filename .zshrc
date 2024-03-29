# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git 
	zsh-autosuggestions
	zsh-syntax-highlighting
	colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#	Environment
export EDITOR=lvim
export VISUAL=lvim
export PAGER=less
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE

# set up notes command 
function notes() {
	#The folder in which to store your notes within your home directory
    FOLDER="Documents/Notes"
	dirs=($HOME/$FOLDER/*)
	index=1 #for ergonomics 
	selection=0
	readarray -t dirs < <(find . -maxdepth 1 -type d -printf '%P\n')	
	echo "Which subject/folder would you like to take notes in?"
	for dir in "${dirs[@]}"
	do 
		echo "\t$((index++))) $(basename $dir)"
	done
	echo -n "[1-$((--index))]: "
	read -r selection
	dir="${dirs[selection]}"
	if test -f "$dir/notes.tex"; then
		vim +VimtexCompile $dir/notes.tex
	else
		cp ~/.vim/templates/notes.tex $dir/notes.tex
		vim +VimtexCompile $dir/notes.tex
	fi
}

# no VIM! only $EDITOR
alias v=$EDITOR
alias vi=$EDITOR
alias vim=$EDITOR

#latex popup
#credit to annoyatron255 for this function
function tx() {
	LATEX_DIR=/tmp/latex_temp
	mkdir -p $LATEX_DIR
	if [[ "$*" != *"edit"* ]]
	then
		echo -e "\\\\begin{align*}\n\t\n\\\\end{align*}" > $LATEX_DIR/latex_input.tex
	fi
	nvim +2 $LATEX_DIR/latex_input.tex
	echo -E "${$(<$HOME/.vim/templates/shortdoc.tex)//CONTENTS/$(<$LATEX_DIR/latex_input.tex)}" > $LATEX_DIR/latex.tex
	( cd $LATEX_DIR ; pdflatex $LATEX_DIR/latex.tex )
	pdfcrop --margins 12 $LATEX_DIR/latex.pdf $LATEX_DIR/latex.pdf
	pdf2svg $LATEX_DIR/latex.pdf $LATEX_DIR/latex.svg
	pdftoppm $LATEX_DIR/latex.pdf $LATEX_DIR/latex -png -f 1 -singlefile -rx 600 -ry 600
	if [[ "$*" == *"svg"* ]]
	then
		nohup xclip -selection clipboard -target image/x-inkscape-svg -i $LATEX_DIR/latex.svg 1>&- 2>&- 0<&-
	else
		nohup xclip -selection clipboard -target image/png -i $LATEX_DIR/latex.png 1>&- 2>&- 0<&-
	fi
}

#ipython sympy environment
function sym() {
	ipython ~/.ipython_sympy.py -i --no-banner --no-confirm-exit
}

export PATH=/home/$USER/.local/bin:$PATH

set -o vi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
