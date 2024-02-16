return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = true,
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
