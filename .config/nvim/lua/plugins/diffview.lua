return {
  -- add gruvbox
  {
    "sindrets/diffview.nvim",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>gD", "<cmd>DiffviewClose<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>gm", "<cmd>DiffviewOpen master<CR>", { noremap = true, silent = true })
    end,
  },
}
