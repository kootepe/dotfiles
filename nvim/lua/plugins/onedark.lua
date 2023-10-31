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
