return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			sections = {
				lualine_a = {
					{
						"filename",
						path = 1,
					},
				},
			},
			options = { theme = "tomorrow_night" },
		})
	end,
}
