return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        highlights = {
          fill = { bg = "#1e2030" },
        },
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
