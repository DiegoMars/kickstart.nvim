-- Ya this is just to see how markdown looks like on your
-- browser
-- Make sure that you have node installed too
-- Actually now idk, what actually worked is running the following:
--:call mkdp#util#install()
--And it worked, idk if would work now that I have a different
--install method tho, but we'll see
--
-- return {
--   "iamcco/markdown-preview.nvim",
--   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--   build = "cd app && yarn install",
--   init = function()
--     vim.g.mkdp_filetypes = { "markdown" }
--   end,
--   ft = { "markdown" },
-- }
--
-- Yea that did not work LMAO
-- Here is what worked then, and remember the whole
-- :call mkdp#util#install()
-- Stuff when using this
return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
}
