return {
  -- add gruvbox
  {
    "sindrets/diffview.nvim",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>gD", "<cmd>DiffviewClose<CR>", { noremap = true, silent = true })
    end,
    -- opts = {
    --   -- transparent_mode = true,
    -- },
  },
  -- -- Configure LazyVim to load gruvbox
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "gruvbox",
  --   },
  -- },
}
