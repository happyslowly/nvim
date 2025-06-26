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
