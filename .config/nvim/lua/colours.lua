require('kanagawa').setup({
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none"
        }
      }
    }
  },
  overrides = function(colors) -- add/modify highlights
    local theme = colors.theme
    return {
      AlphaHeader       = { fg = colors.palette.waveBlue2 },
      AlphaButtons      = { fg = colors.palette.dragonBlue },

      TelescopeTitle = { fg = theme.ui.special, bold = true },
      TelescopePromptNormal = { bg = theme.ui.bg_p1 },
      TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
      TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
      TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
      TelescopePreviewNormal = { bg = theme.ui.bg_dim },
      TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

      BufferLineFill    = { bg = colors.palette.sumiInk2, fg = colors.palette.crystalBlue },
      NvimTreeNormal    = { bg = colors.palette.sumiInk2 },
      NvimTreeNormalNC  = { bg = colors.palette.sumiInk2 },
      NvimTreeWinSeparator = { bg = colors.palette.sumiInk2, fg = colors.palette.sumiInk2 },

      CmpBorder         = { fg = colors.palette.waveBlue2 },
      CmpDocBorder      = { fg = colors.palette.dragonBlue },
      CmpPMenu = { bg = "#1F1F28" },
      CmpSel = { bg = "#a48ec7", fg = colors.palette.sumiInk1 },
    }
  end,
})
vim.cmd "colorscheme kanagawa"
vim.cmd "hi clear CursorLine"
