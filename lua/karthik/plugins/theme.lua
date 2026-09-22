return {
	"nickkadutskyi/jb.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		-- require("jb").setup({transparent = true})
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "jb",
			callback = function()
				-- 1. Fix the Tree-sitter rule
				vim.api.nvim_set_hl(0, "@variable.member.go", { link = "Normal" })

				-- 2. Clear the LSP Semantic Token rule that is overriding it
				vim.api.nvim_set_hl(0, "@lsp.type.property.go", { link = "Normal" })
			end,
		})
		vim.cmd("colorscheme jb")
	end,
}

-- return {
-- 	"AlexvZyl/nordic.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("nordic").load()
-- 	end,
-- }

-- return {
-- 	"thesimonho/kanagawa-paper.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- }

-- return {
-- 	"shaunsingh/nord.nvim",
-- 	lazy = false, -- Load immediately during startup
-- 	priority = 1000, -- Ensure it loads before all other plugins
-- 	config = function()
-- 		-- Optional configuration globals (must be set BEFORE calling colorscheme)
-- 		vim.g.nord_contrast = true
-- 		vim.g.nord_borders = true
-- 		vim.g.nord_disable_background = false
-- 		vim.g.nord_italic = true
--
-- 		-- Load the colorscheme
-- 		vim.cmd("colorscheme nord")
-- 	end,
-- }
