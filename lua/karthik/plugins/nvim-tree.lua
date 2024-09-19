local function my_on_attach(bufnr)
        local api = require "nvim-tree.api"
      
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
      
        -- default mappings
        api.config.mappings.default_on_attach(bufnr)
      
        -- custom mappings
        vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
      end
return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
                        on_attach = my_on_attach,
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


		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
	end,
}
