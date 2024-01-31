return {
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "deep",
      transparent = true,
      lualine = {
        transparent = true,
      },
      code_style = {
        functions = "bold",
      },
      highlights = {
        ["@lsp.type.parameter"] = { fg = "orange", fmt = "italic,bold" },
        ["NormalFloat"] = { bg = "None" },
        ["@none"] = { fg = "none" },
        ["Cursor"] = { bg = "none" },
        ["CursorColumn"] = { bg = "#2f353b" },
        ["CursorLine"] = { bg = "#2f353b" },
        ["Visual"] = { bg = "#55585a" },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
