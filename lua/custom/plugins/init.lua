-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Added a column ruler at 80 characters
vim.opt.colorcolumn = "80,100"
print 'Hello from me'

-- Set tab size
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "javascript", "html", "css", "python", "cpp" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

return {}
