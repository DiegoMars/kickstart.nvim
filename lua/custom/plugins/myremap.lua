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
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'html',
  callback = function()
    vim.keymap.set('n', '<Leader>r', function()
      local file = vim.fn.expand '%:p' -- full path of current file
      local open_cmd
      -- This only works when in windows
      if vim.fn.has 'win32' == 1 then
        open_cmd = 'start "" "' .. file .. '"'
      else
        -- This is for Ubuntu, but idk where else it could work
        open_cmd = 'xdg-open "' .. file .. '"'
      end
      os.execute(open_cmd)
    end, { buffer = true, desc = '[R]un HTML' })
  end,
})

--
-- Cpp remaps
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'cpp',
  callback = function()
    vim.keymap.set('n', '<leader>r', function()
      local filepath = vim.fn.expand '%:p' -- Gets the full path to the current file
      local filedir = vim.fn.expand '%:p:h' -- Gets the directory of the current file
      local filename = vim.fn.expand '%:t:r' -- Gets just the file name without extension
      local is_windows = package.config:sub(1, 1) == '\\'
      -- The above is kinda clever, it checks what the directory separator looks like
      -- For windows it is `\` and on linux it is `/`

      local exe = is_windows and (filedir .. '\\' .. filename .. '.exe') -- For windows, uses `\`
        -- and adds the .exe at the end
        or (filedir .. '/' .. filename) -- For linux, uses `/`

      local compile_cmd = string.format('g++ "%s" -o "%s" && "%s"', filepath, exe, exe)
      -- This creates the cmd string depending on the settings applied

      vim.cmd('split | terminal ' .. compile_cmd) -- Runs the command in a horizontally
      -- split terminal
    end, { buffer = true, desc = '[r]un cpp' })
  end,
})

--
-- Markdown remaps
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.keymap.set('n', '<leader>r', ':MarkdownPreview<CR>', { buffer = true, desc = '[R]un Markdown' })
  end,
})

--
-- Astro remaps
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'astro',
  callback = function()
    vim.keymap.set('n', '<leader>r', function()
      local cmd
      if vim.fn.has 'win32' == 1 then
        cmd = { 'cmd.exe', '/k', 'npm run dev' }
      else
        cmd = { 'gnome-terminal', '--', 'bash', '-c', 'npm run dev; exec bash' }
      end
      vim.fn.jobstart(cmd, { detach = true })
    end, { buffer = true, desc = '[R]un Astro' })
  end,
})

return {}
