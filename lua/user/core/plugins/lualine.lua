local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"AndreM222/copilot-lualine",
	},
}

function M.config()
	require("lualine").setup({
		options = {
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			ignore_focus = { "NvimTree" },
		},
		sections = {

			lualine_a = {},
			lualine_b = { "branch" },
			lualine_c = { "diagnostics" },
			-- lualine_x = { "copilot", "filetype" },
			lualine_x = {
				-- Show LSP client names in the statusline
				function()
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return "No LSP"
					end

					local client_names = {}
					for _, client in ipairs(clients) do
						table.insert(client_names, client.name)
					end

					return "󰒍 " .. table.concat(client_names, ", ")
				end,
				"copilot",
				"filetype",

			},
			lualine_z = { "location" },
		},
		extensions = { "quickfix", "man"},
	})
end

return M
