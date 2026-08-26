return {
	"stevearc/conform.nvim",
	-- "jose-elias-alvarez/null-ls.nvim",
	-- "jayp0521/mason-null-ls.nvim",

	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				go = { "goimports", "gci", "gofmt" },
				sql = { "sql-formatter" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				templ = { "templ" },
			},
			format_on_save = {
				lsp_fallback = "fallback",
				timeout_ms = 5000,
			},
			formatters = {
				prettier = {
					prepend_args = { "--config-precedence", "prefer-file" },
					require_cwd_config = true,
				},
				goimports = {
					prepend_args = { "-local", "github.com/Kong" },
				},
				gci = {
					args = {
						"write",
						"--skip-generated",
						"-s",
						"standard", -- stdlib block
						"-s",
						"default", -- everything else
						"-s",
						"prefix(github.com/Kong)", -- your local group
						"$FILENAME",
					},
					stdin = false,
					-- prepend_args = {
					-- 	"-s",
					-- 	"standard",
					-- 	"-s",
					-- 	"default",
					-- 	"-s",
					-- 	"prefix(github.com/Kong)",
					-- 	-- swap the line above for "-s", "localmodule" to mimic "Current project packages" instead
					-- },
				},
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>ff", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
