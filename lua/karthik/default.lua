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


local map = vim.keymap.set
local opts = {noremap = true, silent = true}

-- custom key binding 
map("n", "<leader>fg", vim.cmd.Ex, opts)

map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)


-- greatest remap ever
map("x", "<leader>p", [["_dP]], opts)

-- next greatest remap ever : asbjornHaland
map({"n", "v"}, "<leader>y", [["+y]], opts)
map("n", "<leader>Y", [["+Y]], opts)
