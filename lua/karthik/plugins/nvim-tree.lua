return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			view = {
				side = "right",
			},
			update_focused_file = {
				enable = true,
			},
                        actions = {
                                open_file = {
                                  quit_on_open = true,
                                },
                              },
		})
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
	end,
}
