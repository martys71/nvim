local map = vim.keymap.set

map("n", "<leader>rcu", function()
  require("crates").upgrade_all_crates()
end, { desc = "Upgrade all crates " })
