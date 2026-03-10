vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.diagnostic.config({
    virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN }
    },
    jump = {
        severity = { min = vim.diagnostic.severity.HINT },
        float = true
    },
    underline = false,
    virtual_lines = false,
    severity_sort = true,
})

vim.opt.incsearch = true

vim.opt.scrolloff = 6

vim.opt.updatetime = 50
vim.opt.colorcolumn = "100"
