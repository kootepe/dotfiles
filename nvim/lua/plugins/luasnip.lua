return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "kootepe/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_snipmate").load({ paths = "~/.config/nvim/snippets" })
    end,
  },
}
