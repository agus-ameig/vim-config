local function config_cmp()
  local cmp = require("cmp")
  cmp.setup({
    sources = {
      { name = "path", group_index = 1 },
      { name = "nvim_lsp", group_index = 1 },
      { name = "buffer", keyword_length = 3, group_index = 2},
      { name = "luasnip", keyword_length = 2, group_index = 2 },
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
    },
    formatting = {
      fields = { "menu", "abbr", "kind" },
      format = require("lspkind").cmp_format({
        maxwidth = 50,
        ellipsis_char = "...",
        before = function(entry, vim_item)
          local menu_icon = {
            nvim_lsp = "λ",
            luasnip = "⋗",
            buffer = "",
            path = "",
            nvim_lua = "",
            copilot = "",
          }
          vim_item.menu = menu_icon[entry.source.name]
          return vim_item
        end,
      }),
    },
  })
end
return {
  config_cmp = config_cmp
}
