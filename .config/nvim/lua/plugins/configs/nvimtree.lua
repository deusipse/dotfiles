require("nvim-tree").setup({
  disable_netrw = true,
  hijack_cursor = true,
  sort_by = "case_sensitive",
  update_cwd = true,
  filesystem_watchers = {
    enable = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
    highlight_opened_files = "name"
  },
  filters = {
    dotfiles = true,
  },

})
