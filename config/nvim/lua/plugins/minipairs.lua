return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      -- NOTE: this is the the same as minipairs disable func
      -- Snacks.toggle({
      --   name = "Autopair",
      --   get = function()
      --     return not vim.g.autopairs_disable
      --   end,
      --   set = function(state)
      --     vim.g.autopairs_disable = not state
      --   end,
      -- }):map("<leader>up"),
    },
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = false },
      -- skip autopair when next character is one of these
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- skip autopair when the cursor is inside these treesitter nodes
      skip_ts = { "asd" },
      -- skip autopair when next character is closing pair
      -- and there are more closing pairs than opening pairs
      skip_unbalanced = false,
      -- better deal with markdown code blocks
      markdown = true,
    },
    config = function(_, opts)
      LazyVim.mini.pairs(opts)
    end,
  },
}
