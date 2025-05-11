vim.keymap.set('n', '<Leader>E', vim.cmd.Ex, { desc = '[E]xplore' })
vim.keymap.set('n', '<Leader>em', ':e $MYVIMRC<CR>', { desc = '[e]dit [m]yvimrc' })
vim.keymap.set('n', '<Leader>c', ':bd!<CR>', { desc = '[C]lose buffer' })

-- Python remaps. These are to run python with just keyboard shortcuts
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.keymap.set('n', '<Leader>r', ':sp | term python %<CR>', { buffer = true, desc = '[R]un Python' })
  end,
})

return {}
