require("nvim-treesitter.configs").setup{
  ensure_installed = {
    "python",
    "c",
    "cpp",
    "lua",
    "vim",
    "bash",
  },
  highlight = {
    enable = true,
    disable = {"latex"},
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
