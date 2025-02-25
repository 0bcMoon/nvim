local M = {
  "numToStr/Comment.nvim",
  lazy = false,
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
  },
}

function M.config()

  vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)")
  vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")

  vim.g.skip_ts_context_commentstring_module = true
  ---@diagnostic disable: missing-fields
  require("ts_context_commentstring").setup {
    enable_autocmd = true,
  }

  require("Comment").setup {
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  }
end

return M
