-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f" -- wtf is going on here and where is the docuemtnation for the interface at the `vim` namespace?
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 99
-- vim.opt.textwidth = 120
vim.opt.mouse:append("a")

vim.g.conjure_client_python_stdio_command = { "poetry", "run", "python", "-iq" }
