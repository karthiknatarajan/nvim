return {
	"nvim-lualine/lualine.nvim",
	dependencies = {"nvim-tree/nvim-web-devicons", "folke/tokyonight.nvim"},
	config = function()
		require("lualine").setup({
			sections = {
				lualine_a = {
					{
						'filename',
						path = 1,
					}
				}
			},
			options = {theme = "tokyonight"}
		})
	end
}
