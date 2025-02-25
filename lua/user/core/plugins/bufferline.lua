local M = {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
}

function M.config()
    vim.opt.termguicolors = true

        vim.keymap.set("n", "<leader>c", "<cmd>:bd | bprev<cr>")
        vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { noremap = true, silent = true })
        -- Switch to the previous buffer
        vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { noremap = true, silent = true })
    -- Example bufferline.nvim setup
    require("bufferline").setup({
        options = {
            mode = "buffers", -- Set to "tabs" if you prefer tab mode
            numbers = "ordinal", -- Show buffer numbers
            close_command = "bdelete! %d", -- Command to close a buffer
            right_mouse_command = "bdelete! %d", -- Right-click to close a buffer
            left_mouse_command = "buffer %d", -- Left-click to switch to a buffer
            middle_mouse_command = nil, -- Middle-click behavior
            indicator = {
                icon = "▎", -- Indicator icon
            },
            modified_icon = "●", -- Modified buffer icon
            close_icon = "", -- Close icon
            left_trunc_marker = "", -- Left truncation marker
            right_trunc_marker = "", -- Right truncation marker
            name_formatter = function(buf) -- Format buffer names
                return buf.name
            end,
            max_name_length = 18,        -- Max length of buffer names
            max_prefix_length = 15,      -- Max length of buffer prefixes
            tab_size = 18,               -- Size of tabs
            diagnostics = "nvim_lsp",    -- Enable LSP diagnostics
            diagnostics_update_in_insert = false, -- Don't update diagnostics in insert mode
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
            color_icons = true,    -- Use color icons
            show_buffer_icons = true, -- Show buffer icons
            show_buffer_close_icons = true, -- Show close icons
            show_close_icon = true, -- Show close icon
            show_tab_indicators = true, -- Show tab indicators
            persist_buffer_sort = true, -- Persist buffer sorting
            separator_style = "thin", -- Separator style
            enforce_regular_tabs = false, -- Don't enforce regular tabs
            always_show_bufferline = true, -- Always show the bufferline
        },
    })
end

return M
