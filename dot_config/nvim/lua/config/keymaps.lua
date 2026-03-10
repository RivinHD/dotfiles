local map = vim.keymap.set

-- Quick Leader actions
map("n", "<Leader>h", "<C-w>h")
map("n", "<Leader>j", "<C-w>j")
map("n", "<Leader>k", "<C-w>k")
map("n", "<Leader>l", "<C-w>l")

map("n", "<Leader>/", "<CMD>noh<CR>")
map("n", "<Leader>w", "<CMD>w<CR>")

map("n", "<Leader>y", '"+y')
map("n", "<Leader>Y", '"+Y')
map("x", "<Leader>y", '"+y')

map("n", "<Leader>n", function()
	vim.diagnostic.jump({ count = 1 })
end)
map("n", "<Leader>p", function()
	vim.diagnostic.jump({ count = -1 })
end)
map("n", "<Leader>e", function()
	vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
end)

-- Page Jump
map("n", "<C-d>", "<C-d>zzzv")
map("n", "<C-u>", "<C-u>zzzv")

-- Search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Move visual lines
map("x", "J", ":m '>+1<CR>gv=gv")
map("x", "K", ":m '<-2<CR>gv=gv")

-- Fix visual mode escape
map("i", "<C-c>", "<Esc>")

-- Quick fix
map("n", "<C-j>", "<CMD>cnext<CR>")
map("n", "<C-k>", "<CMD>cprevious<CR>")

-- Diff editor
map("n", "<M-j>", "]c")
map("n", "<M-k>", "[c")

-- Terminal Remap
map("t", "<Esc>", "<C-\\><C-n>")

-- LSP Remap
map("n", "<Leader>ca", vim.lsp.buf.code_action)
map("n", "gd", vim.lsp.buf.definition)
