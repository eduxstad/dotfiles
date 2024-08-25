-- Open buffer in last known cursor position, unless invalid, inside event handler, or commit message.
-- TODO: Convert to lvim autocommand
vim.cmd [[
  autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
]]

vim.cmd [[
  set spell
  set spelllang=en
]]

-- Tab key will jump to next vsplit buffer
lvim.keys.normal_mode["<Tab>"] = "<C-w>w"

lvim.builtin.terminal.shell = "/usr/bin/zsh"

-- Make search layout bigger
lvim.builtin.telescope.defaults.layout_strategy = 'horizontal'
lvim.builtin.telescope.defaults.layout_config.width = 0.8
lvim.builtin.telescope.defaults.layout_config.height = 0.7
lvim.builtin.telescope.defaults.path_display = { 'smart' }

-- Make nvim-tree autoexpand to display long files
lvim.builtin.nvimtree.setup.view.adaptive_size = 'true'
lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true

lvim.builtin.nvimtree.setup.git.timeout = 5000
lvim.builtin.nvimtree.setup.renderer.indent_width = 1

lvim.transparent_window = true
vim.opt.wrap = true

-- Install Persistence
-- lvim.plugins = {
--   { "folke/persistence.nvim" },
--   event = "BufReadPre",
-- }

lvim.transparent_window = true
vim.opt.wrap = true

lvim.plugins = {
  "David-Kunz/gen.nvim",
  opts = {
    model = "llama3.1",
  }
}

require('gen').prompts['Fix_Code'] = {
  prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
  replace = true,
  extract = "```$filetype\n(.-)```"
}

-- table.insert(lvim.plugins, {
--   "zbirenbaum/copilot-cmp",
--   event = "InsertEnter",
--   dependencies = { "zbirenbaum/copilot.lua" },
--   config = function()
--     vim.defer_fn(function()
--       require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
--       require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
--     end, 100)
--   end,
-- })
