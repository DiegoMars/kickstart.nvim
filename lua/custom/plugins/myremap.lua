--
-- These are just some kepmaps that I find useful lmao
--

--
-- Some general keymaps
vim.keymap.set('n', '<Leader>E', vim.cmd.Ex, { desc = '[E]xplore' })
vim.keymap.set('n', '<Leader>c', ':bd!<CR>', { desc = '[C]lose buffer' })

--
-- Edit keymaps
vim.keymap.set('n', '<Leader>em', ':e $MYVIMRC<CR>', { desc = '[e]dit [m]yvimrc' })

--
-- Python remaps. These are to run python with just keyboard shortcuts
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.keymap.set('n', '<Leader>r', ':sp | term python %<CR>', { buffer = true, desc = '[R]un Python' })
  end,
})

-- 
-- HTML rempas. These are run html sites with just keyboard shortcuts
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  callback = function()
    vim.keymap.set('n', '<Leader>r', function()
      local file = vim.fn.expand('%:p')  -- full path of current file
      local open_cmd
      -- This only works when in windows
      if vim.fn.has('win32') == 1 then
        open_cmd = 'start "" "' .. file .. '"'
      else
      -- This is for Ubuntu, but idk where else it could work 
        open_cmd = 'xdg-open "' .. file .. '"'
      end
      os.execute(open_cmd)
    end, { buffer = true, desc = '[R]un HTML' })
  end,
})

return {}
