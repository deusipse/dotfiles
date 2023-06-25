require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'kanagawa',
    section_separators = { left = "", right = "" },
    component_separators = "",
    disabled_filetypes = { "alpha" },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { { "mode", separator = { left = "" } } },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", file_status = true, path = 3, icon = "󰉖 " } },
    lualine_x = {
      {
        function()
          local msg = "No Active Lsp"
          local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = " LSP:",
        color = { fg = "#7E9CD8" }
      },
      {
        "lsp_progress",
        colors = {
          percentage = "#7E9CD8",
          title      = "#7E9CD8",
          spinner    = "#7E9CD8",
          use        = true,
        },
        display_components = { "spinner", { "title", "percentage" } },
        spinner_symbols = { " ", " ", " ", " " },
      },
      "encoding", "filetype" },
    lualine_y = { { "os.date('%H:%M:%S', os.time())", icon = " " } },
    lualine_z = { { "progress", icon = "󰗗", separator = { right = "" } } },
  }
}
