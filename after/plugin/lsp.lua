local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
  'lua_ls',
})
require("luasnip.loaders.from_vscode").lazy_load()
require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


local cmp = require('cmp')                       -- cmp
local cmp_action = lsp.cmp_action()              -- cmp cmp_action
local luasnip = require("luasnip")               -- lua snip
local cmp_mappings = lsp.defaults.cmp_mappings({ -- cmp_mappings
  -- `Enter` key to confirm completion
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
      -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
      -- that way you will only jump inside the snippet region
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif has_words_before() then
      cmp.complete()
    else
      fallback()
    end
  end, { "i", "s" }),

  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" }),
  -- Ctrl+Space to trigger completion menu
  ['<C-Space>'] = cmp.mapping.complete(),

  -- Navigate between snippet placeholder
  ['<C-f>'] = cmp_action.luasnip_jump_forward(),
  ['<C-b>'] = cmp_action.luasnip_jump_backward(),

  -- Scroll up and down in the completion documentation
  ['<C-u>'] = cmp.mapping.scroll_docs(-4),
  ['<C-d>'] = cmp.mapping.scroll_docs(4),
})

local cmp_snippets = {
  expand = function(args)
    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  end,
}


local cmp_sources = cmp.config.sources({
    { name = 'copilot' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
  },
  {
    { name = 'buffer' },
  }
)

cmp.setup({
  sources = cmp_sources,
  mapping = cmp_mappings,
  snippet = cmp_snippets,
  experimental = {
    ghost_text = true,
  },
  window = {
    documentation = cmp.config.window.bordered({
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
    }),
  },
})

lsp.set_sign_icons({
  copilot = '"',
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.set_preferences({
  suggest_lsp_servers = true,
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  lsp.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false
  })

  local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
  local event = "BufWritePre" -- or "BufWritePost"
  local async = event == "BufWritePost"

  if client.supports_method("textDocument/formatting") then
    vim.keymap.set("n", "<Leader>f", function()
      vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
    end, { buffer = bufnr, desc = "[lsp] format" })

    -- format on save
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      buffer = bufnr,
      group = group,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr, async = async })
      end,
      desc = "[lsp] format on save",
    })
  end

  if client.supports_method("textDocument/rangeFormatting") then
    vim.keymap.set("x", "<Leader>f", function()
      vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
    end, { buffer = bufnr, desc = "[lsp] format" })
  end
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
