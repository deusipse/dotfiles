require("bufferline").setup({
  options = {
    offsets = { { filetype = "NvimTree", text = "", highlight = "BufferlineFill", padding = 1 } },
    buffer_close_icon = "󰅖",
    modified_icon = "",
    close_icon = "󰅙",
    show_close_icon = false,
    left_trunc_marker = " ",
    right_trunc_marker = " ",
    max_name_length = 20,
    max_prefix_length = 13,
    tab_size = 20,
    enforce_regular_tabs = false,
    show_buffer_close_icons = true,
    separator_style = "thin",
    themable = true,
  },
})
