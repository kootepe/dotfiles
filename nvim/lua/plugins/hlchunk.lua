return {
  {
    "shellRaining/hlchunk.nvim",
    opts = {
      indent = {
        enable = true,
        chars = { "│" }, -- more code can be found in https://unicodeplus.com/

        style = {
          "#717171",
        },
      },
      blank = {
        enable = false,

        chars = {
          " ",
        },

        style = {
          { bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("underline")), "bg", "gui") },
          { bg = "", fg = "" },
        },
      },
      line_num = {
        enable = true,
        use_treesitter = true,
        style = "#8653d1",
      },

      chunk = {
        enable = true,
        notify = false,
        use_treesitter = true,
        -- details about support_filetypes and exclude_filetypes in https://github.com/shellRaining/hlchunk.nvim/blob/main/lua/hlchunk/utils/filetype.lua
        style = {
          { fg = "#FF10F0" },
        },
        textobject = "",
        max_file_size = 1024 * 1024,
        error_sign = false,
      },
    },
  },
}
