return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects" }, -- Syntax aware text-objects
		{
			"nvim-treesitter/nvim-treesitter-context", -- Show code context
			opts = { enable = true, mode = "topline", line_numbers = true },
		},
	},
	config = function()
		require("nvim-treesitter.install").prefer_git = true
		local treesitter = require("nvim-treesitter.config")

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "markdown" },
			callback = function(ev)
				-- treesitter-context is buggy with Markdown files
				require("treesitter-context").disable()
			end,
		})

		treesitter.setup({
			ensure_installed = {
				"csv",
				"dockerfile",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"templ",
				"gowork",
				"javascript",
				"json",
				"lua",
				"markdown",
				"proto",
				"python",
				"rego",
				"ruby",
				"sql",
				"svelte",
				"yaml",
				"php",
			},
			-- indent = {enable = true},
			auto_install = true,
			sync_install = false,
			highlight = {
				enable = true,
				-- disable = {"csv"} -- preferring chrisbra/csv.vim
			},
			-- textobjects = {select = {enable = true, lookahead = true}}
		})

		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = { "go", "gomod", "lua", "vim" }, -- Add any other languages here
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
