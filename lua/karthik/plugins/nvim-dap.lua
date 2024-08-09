return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add/Remove breakpoint at line" })
		vim.keymap.set("n", "<leader>ds", function()
			require("dap").continue()
		end,
		{desc = "Start debugging"})
		vim.keymap.set("n", "<leader>dus", function()
			local widgets = require('dap.ui.widgets');
			local sidebar = widgets.sidebar(widgets.scopes);
			sidebar.open();	
		end, 
		{desc = "Open debugger sidebar" })
	end
}
