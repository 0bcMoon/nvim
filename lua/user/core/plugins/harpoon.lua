local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap("n", "<S-m>", "<cmd>lua require('user.core.plugins.harpoon').mark_file()<cr>", opts)
  keymap("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
  keymap("n", "<M-3>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", opts)
  keymap("n", "<M-2>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", opts)
  keymap("n", "<M-1>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", opts)

-- :lua require("harpoon.ui").nav_file(3)                  -- navigates to file 3
end

function M.mark_file()
  require("harpoon.mark").add_file()
  vim.notify "󱡅  marked file"
end

return M
