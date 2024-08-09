return {
	"leoluz/nvim-dap-go",
	dependecies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		local dap = require("dap-go")

		dap.setup()
		
		vim.keymap.set("n", "<leader>dtg", function()
require('dap-go').debug_test()
		end, 
		{desc = "Debug go test" })

	end
}
