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
        ["Hlargs"] = { fg = "orange", fmt = "italic,bold" },
        ["MiniIndentscopeSymbol"] = { fg = "#FF10F0", fmt = "italic,bold" },
        ["@lsp.type.parameter"] = { fg = "orange", fmt = "italic,bold" },
        -- ["@variable.builtin.python"] = { fg = "red", fmt = "italic" },
        ["NormalFloat"] = { bg = "None" },
        ["@none"] = { fg = "none" },
        ["Cursor"] = { bg = "none" },
        ["Comment"] = { fg = "grey" },
        -- ["CursorColumn"] = { bg = "#2f353b" },
        -- ["CursorLine"] = { bg = "#2f353b" },
        ["CursorColumn"] = { bg = "#0d283f" },
        ["CursorLine"] = { bg = "#0d283f" },
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
