-- Filetype-specific indent settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "lua", "yaml" },
	callback = function()
		local ft = vim.bo.filetype
		if ft == "python" or ft == "lua" then
			vim.bo.shiftwidth = 4
			vim.bo.softtabstop = 4
			vim.bo.tabstop = 4
		elseif ft == "yaml" then
			vim.wo.cursorcolumn = true
		end
	end,
})

-- vim.pack build hooks (must run before any vim.pack.add())
vim.api.nvim_create_autocmd("PackChanged", { callback = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind
	if name == "leetcode.nvim" and kind == "install" then
		vim.schedule(function() vim.cmd("TSUpdate html") end)
	end
	if name == "nvim-treesitter" and kind == "update" then
		if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
		vim.cmd("TSUpdate")
	end
end })

-- Neovide
if vim.g.neovide then
	vim.keymap.set("v", "<D-c>", '"+y')
	vim.keymap.set("n", "<D-v>", 'h"+p')
	vim.keymap.set("v", "<D-v>", 'h"+p')
	vim.keymap.set("c", "<D-v>", "<C-R>+")
	vim.keymap.set("i", "<D-v>", '<ESC>"+pa')

	vim.g.neovide_position_animation_length = 0
	vim.g.neovide_cursor_animation_length = 0.00
	vim.g.neovide_cursor_trail_size = 0
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_scroll_animation_far_lines = 0
	vim.g.neovide_scroll_animation_length = 0.00
	vim.g.neovide_theme = "dark"
end
