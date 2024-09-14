local g = vim.g
local map = vim.keymap.set

local function check_env_var()
  local conda_env_name = os.getenv("CONDA_DEFAULT_ENV")
  if conda_env_name == "r_env" then
    g.jukit_shell_cmd = "radian"
    map("n", "<leader>os", '<cmd>call jukit#splits#output("conda activate r_env")<cr>', { desc = "Open output split" })
  elseif conda_env_name == "johan_env" then
    g.jukit_shell_cmd = "R"
    map(
      "n",
      "<leader>os",
      '<cmd>call jukit#splits#output("conda activate johan_env")<cr>',
      { desc = "Open output split" }
    )
  end
end

return {
  {
    "luk400/vim-jukit",
    lazy = true,
    keys = {
      { "<leader>os", "<cmd>call jukit#splits#output()<cr>", { desc = "Open output split" } },
    },
    -- cond = vim.env.VAR_NAME == 0,
    ft = {
      "ipynb",
      "jupyter",
    },
  },
  check_env_var(),
}
