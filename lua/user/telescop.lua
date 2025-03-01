
local builtin = require('telescope.builtin')
local keymap = vim.keymap.set
local opts = { noremap = true, silent = false }
keymap("n", "<leader>bb", builtin.buffers , opts)
keymap("n", "<leader>sb", builtin.current_buffer_fuzzy_find, opts)
keymap("n", "<leader>sc", builtin.colorscheme, opts)
keymap("n", "<leader>sf", builtin.find_files, opts)
keymap("n", "<leader>e", builtin.find_files, opts)
keymap("n", "<leader>st", builtin.live_grep, opts)
keymap("n", "<leader>sh", builtin.help_tags, opts)
keymap("n", "<leader>sl", builtin.resume, opts)
keymap("n", "<leader>sr", builtin.oldfiles, opts)
keymap("n", "<leader>ls", builtin.lsp_document_symbols, opts)
keymap("n", "<leader>lw", builtin.lsp_workspace_symbols, opts)
keymap("n", "<leader>lw", builtin.lsp_workspace_symbols, opts)
keymap("n", "<leader>ld", builtin.diagnostics, opts)

keymap("n", "<leader>sp", "<cmd>lua require('telescope', opts).extensions.projects.projects()<cr>")
