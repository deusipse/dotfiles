local opt = vim.opt
local g = vim.g

g.mapleader = " "

opt.number = true
opt.ruler = false

opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2

opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "nosplit"

opt.foldmethod = "indent"
opt.foldlevel = 100

opt.autochdir = true
opt.signcolumn = "yes"
opt.showmatch = true
opt.lazyredraw = true
opt.showmode = false
opt.scrolloff = 5
opt.updatetime = 250
opt.undofile = true
opt.swapfile = false
opt.cursorline = true

local disabled_plugins = {
  "netrw",
  "gzip",
  "zip",
  "netrwPlugin",
  "netrwSettings",
  "tar",
  "tarPlugin",
  "netrwFileHandlers",
  "zipPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "spellfile_plugin",
  "matchit",
}
for _, plugin in pairs(disabled_plugins) do
  g["loaded_" .. plugin] = 1
end

-- Mappings

vim.cmd("vnoremap <S-j> :m '>+1<CR>gv=gv")     -- Shift j, k to move lines
vim.cmd("vnoremap <S-k> :m '<-2<CR>gv=gv")
vim.cmd('xnoremap <S-y> "*y')                  -- Copy to clipboard
vim.cmd("noremap <C-s> <cmd>update<CR>")       -- Save file
vim.cmd("inoremap <C-s> <cmd>update<CR>")      -- Save file
vim.cmd("noremap <leader>n <cmd>NvimTreeToggle<CR>")
vim.cmd("noremap <ESC> <cmd>noh<CR>")
vim.cmd("vnoremap <ESC> <ESC>")
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})

vim.cmd("noremap <leader>c <cmd>TermExec cmd='g++-13 -O3 -march=native %; ./a.out' <cr>") -- Compile with G++
