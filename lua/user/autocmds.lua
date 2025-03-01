vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.sh",
	command = "nnoremap me :!%<CR>"

})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.py",
	command = "nnoremap me :! python3 -u %<CR>",

})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.c",

	callback = function(args)
		vim.cmd("nnoremap me :!cc  -Wall -Wextra % -o main <CR>")
	end,

})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.cpp",
	-- command = "nnoremap me :!c++ -std=c++17 -Wall -Wextra  % -o main <CR>",

	callback = function(args)
			vim.cmd( "nnoremap me :!c++ -std=c++17 -Wall -Wextra -Wshadow  -DDEBUG  % -o main <CR>")
		vim.cmd( "nnoremap mr :!c++ -std=c++17 -Wall -Wextra  % -o main && ./main < input <CR>")
	end,

})
