local function my_on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
end
return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
			on_attach = my_on_attach,
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			view = {
				side = "right",
				width = function()
					-- Calculate 20% of the total screen width
					local percentage = 0.20
					local calculated_width = math.floor(vim.go.columns * percentage)

					-- Set bounding limits so it doesn't get too small or too large
					return math.max(30, math.min(calculated_width, 50))
				end,
			},
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
		})

		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
	end,
}
