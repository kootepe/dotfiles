return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = true,
  -- keys = {
  --   {
  --     "<leader>cn",
  --     function()
  --       require("neogen").generate()
  --     end,
  --     desc = "Generate Annotations (Neogen)",
  --   },
  -- },
  opts = {
    languages = {
      python = {
        template = {
          annotation_convention = "numpydoc",
        },
      },
    },
  },
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
-- return {
--   "danymat/neogen",
--   cmd = "Neogen",
--   dependencies = "nvim-treesitter/nvim-treesitter",
--   keys = {
--     {
--       "<leader>cn",
--       function()
--         require("neogen").generate()
--       end,
--       desc = "Generate Annotations (Neogen)",
--     },
--   },
--   opts = function(_, opts)
--     if opts.snippet_engine ~= nil then
--       return
--     end
--
--     local map = {
--       ["LuaSnip"] = "luasnip",
--       ["nvim-snippy"] = "snippy",
--       ["vim-vsnip"] = "vsnip",
--     }
--
--     for plugin, engine in pairs(map) do
--       if LazyVim.has(plugin) then
--         opts.snippet_engine = engine
--         return
--       end
--     end
--
--     if vim.snippet then
--       opts.snippet_engine = "nvim"
--     end
--   end,
--   languages = {
--     python = {
--       template = {
--         annotation_convention = "numpydoc",
--       },
--     },
--   },
-- }
