local cmp = require'cmp'

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  window = {
    completion = {
      border = border "CmpBorder",
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel",
      scrollbar = false,
    },
    documentation = {
      border = border "CmpDocBorder",
    },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<ESC>:call UltiSnips#JumpForwards()<CR>", true, true, true), "")
      elseif cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, {
        "i",
        "s",
      }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<ESC>:call UltiSnips#JumpBackwards()<CR>", true, true, true), "")
      elseif cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, {
        "i",
        "s",
      }),
}),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "ultisnips" },
    { name = "path" },
    { name = "buffer" },
  })
})

local tex_sources = cmp.config.sources({
  { name = "nvim_lsp" },
  { name = "ultisnips" },
  { name = "path" },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = "tex",
  callback = function()
    cmp.setup.buffer {
      sources = tex_sources
    }
  end
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
