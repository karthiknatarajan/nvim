-- return {
-- 	"folke/tokyonight.nvim",
-- 	config = function()
-- 		vim.cmd.colorscheme("tokyonight-night")
-- 	end,
-- }
--
return {
	"nickkadutskyi/jb.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		-- require("jb").setup({transparent = true})
		vim.cmd("colorscheme jb")
	end,
}
