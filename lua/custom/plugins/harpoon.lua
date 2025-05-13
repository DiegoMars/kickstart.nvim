-- The Primeagen's harpoon Plug In
-- I wanna figure out how to do the configuration stuff too
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[h]arpoon [a]dd' })
    vim.keymap.set('n', '<leader>he', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[h]arpoon [e]xplore' })

    -- Exploring the harpooned buffers
    -- So looks like you cannot map stuff to <C-'a number'> because
    -- it doesn't input the right ascii (or smt like that)
    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { desc = 'Buffer [1]' })
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { desc = 'Buffer [2]' })
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { desc = 'Buffer [3]' })
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { desc = 'Buffer [4]' })

    -- Toggle previous & next buffers stored within Harpoon list
    -- This does not work in windows because of pwsh keybinds
    -- Specifically <C-S-P> stuff
    vim.keymap.set('n', '<leader>p', function()
      harpoon:list():prev()
    end, {desc = '[p]revious'})
    vim.keymap.set('n', '<leader>n', function()
      harpoon:list():next()
    end, {desc = '[n]ext'})

    -- Keybind to remove file from harpoon's list
    vim.keymap.set('n', '<leader>hr', function()
      require('harpoon'):list():remove()
    end, { desc = '[h]arpoon [r]emove current buff' })

    -- This is to use telescope as a UI
    -- Bruh I am a dumbass, this overwrites the keybinds above I think
    -- local conf = require('telescope.config').values
    -- local function toggle_telescope(harpoon_files)
    --   local file_paths = {}
    --   for _, item in ipairs(harpoon_files.items) do
    --     table.insert(file_paths, item.value)
    --   end
    --
    --   require('telescope.pickers')
    --     .new({}, {
    --       prompt_title = 'Harpoon',
    --       finder = require('telescope.finders').new_table {
    --         results = file_paths,
    --       },
    --       previewer = conf.file_previewer {},
    --       sorter = conf.generic_sorter {},
    --     })
    --     :find()
    -- end
    --
    -- vim.keymap.set('n', '<C-e>', function()
    --   toggle_telescope(harpoon:list())
    -- end, { desc = 'Open harpoon window' })
  end,
}
