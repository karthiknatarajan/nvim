vim.g.mapleader = ","

vim.opt.encoding = "utf-8"

vim.opt.compatible = false
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.vb = true
vim.opt.ruler = true
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.autoindent = true
vim.opt.colorcolumn = "120"
vim.opt.textwidth = 120
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamed"
vim.opt.scrollbind = false
vim.opt.wildmenu = true
vim.opt.scrolloff = 15

vim.opt.tabstop = 3
vim.opt.shiftwidth = 3

-- disable netw since for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- filetype related 
vim.api.nvim_create_autocmd("FileType", {
	pattern = {"gitcommit"},
	callback = function(ev)
		vim.api.nvim_set_option_value("textwidth", 72, {scope = "local"})
	end
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {"markdown"},
	callback = function(ev)
		vim.api.nvim_set_option_value("textwidth", 0, {scope = "local"})
		vim.api.nvim_set_option_value("wrapmargin", 0, {scope = "local"})
		vim.api.nvim_set_option_value("linebreak", true, {scope = "local"})
	end
})

--[[ vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.templ",
	callback = function(args)
		vim.lsp.buf.format({
        filter = function(client)
            -- apply whatever logic you want (in this example, we'll only use null-ls)
				print(client.name)
				print(client.name == "templ")
            return client.name == "templ"
        end
    })
	end,
}) ]]

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.filetype.add({ extension = { templ = "templ" } })

local map = vim.keymap.set
local opts = {noremap = true, silent = true}

map("n", ";", ":", opts)
map("n", "<Tab>", ":w<CR>", opts)
-- custom key binding 
map("n", "fg", vim.cmd.Ex, opts)

map({"n","i"}, "A-l", vim.cmd.Esc, opts)

map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)


-- greatest remap ever
map("x", "<leader>p", [["_dP]], opts)

-- next greatest remap ever : asbjornHaland
map({"n", "v"}, "<leader>y", [["+y]], opts)
map("n", "<leader>Y", [["+Y]], opts)


-- window navigation
map("n", "<A-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<A-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<A-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<A-k>", "<C-w>k", { desc = "switch window up" })

-- buffer navigation
map("n", "<A-d>", "<C-d>", opts)
map("n", "<A-u>", "<C-u>", opts)
