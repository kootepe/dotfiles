return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- numbers = "ordinal" | "buffer_id",
        always_show_bufferline = true,
        indicator = {
          icon = "▎", -- this should be omitted if indicator style is not 'icon'
          style = "underline",
        },
      },
    },
    keys = {
      -- { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
      -- { "S-ö", "<cmd>BufferLineMoveNext<CR>", desc = "Move buffer forward" },
      -- { "S-ä", "<cmd>BufferLineMovePrev<CR>", desc = "Move buffer backward" },
    },
  },
}
