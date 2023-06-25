require("indent_blankline").setup {
  filetype_exclude = {
    "vimwiki",
    "lspinfo",
    "packer",
    "checkhealth",
    "TelescopePrompt",
    "TelescopeResults",
    "alpha",
    "terminal",
    "help"
  },
  buftype_exclude = { "terminal" },
  show_current_context = true,
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
}
