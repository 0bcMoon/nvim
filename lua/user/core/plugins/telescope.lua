local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
    "nvim-lua/plenary.nvim",
  },
  -- lazy = true,
  cmd = "Telescope",
}

function M.config()

    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>bb", "<cmd>Telescope buffers previewer=false<cr>", opts)
    vim.keymap.set("n", "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
    vim.keymap.set("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>", opts)
    vim.keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", opts)
    vim.keymap.set("n", "<leader>sp", "<cmd>lua require('telescope', opts).extensions.projects.projects()<cr>")
    vim.keymap.set("n", "<leader>st", "<cmd>Telescope live_grep<cr>", opts)
    vim.keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", opts)
    vim.keymap.set("n", "<leader>sl", "<cmd>Telescope resume<cr>", opts)
    vim.keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", opts)

    vim.keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", opts)
    vim.keymap.set("n", "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<cr>", opts)
    vim.keymap.set("n", "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<cr>", opts)
    vim.keymap.set("n", "<leader>ld", "<cmd>Telescope diagnostics<cr>", opts)

  local icons = require "user.icons"
  local actions = require "telescope.actions"

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },

      mappings = {
        i = {
          ["<C-j>"] = actions.cycle_history_next,
          ["<C-k>"] = actions.cycle_history_prev,

          ["<Tab>"] = actions.move_selection_next,
          ["<S-Tab>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {
        -- theme = "dropdown",
      },
      grep_string = {
        theme = "dropdown",
      },

      find_files = {
        theme = "dropdown",
        previewer = false,
      },

      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        enable_preview = true,
      },

      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },

      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }
end

return M
