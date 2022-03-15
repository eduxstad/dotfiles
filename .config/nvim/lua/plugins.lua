vim.cmd('packadd packer.nvim')
local use = require('packer').use

vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerSync]])
return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	
	-- Programming
	use 'SirVer/ultisnips'
	use 'lervag/vimtex'
	use 'leafgarland/typescript-vim'
	use 'posva/vim-vue'
end)
