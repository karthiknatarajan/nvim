return {
	"stevearc/conform.nvim",
	-- "jose-elias-alvarez/null-ls.nvim",
	-- "jayp0521/mason-null-ls.nvim",

	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		-- Reads the module path from the nearest go.mod so goimports groups
		-- local-package imports into their own block, matching each repo's
		-- golangci-lint `goimports.local-prefixes` setting (repos differ, e.g.
		-- github.com/Kong/* vs github.com/kong-konnect/*).
		local function goimports_local_prefix(_, ctx)
			local gomod = vim.fs.find("go.mod", { path = ctx.dirname, upward = true })[1]
			if not gomod then
				return {}
			end
			local f = io.open(gomod, "r")
			if not f then
				return {}
			end
			local first_line = f:read("*l")
			f:close()
			local mod = first_line and first_line:match("^module%s+(%S+)")
			return mod and { "-local", mod } or {}
		end

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
				go = { "goimports", "gofmt" },
				sql = { "pg_format" },
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
					prepend_args = goimports_local_prefix,
				},
				pg_format = {
					prepend_args = { "--vertical-align", "--type-case", "2" },
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
