-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function yank_filename_of_current_file()
  -- this gets the absolute path of the currently open buffer.
  -- local current_filename = vim.api.nvim_buf_get_name(0)

  -- whereas this gets the path of the currently open buffer relative to the root of the project.
  local current_filename = vim.fn.expand("%")

  -- set the value of the "+" register, which is synchronised with the system clipboard.
  vim.fn.setreg("+", current_filename)

  print(
    "The system clipboard has been set to the relative path of the currently open buffer. \n ("
      .. current_filename
      .. ")"
  )
end

function yank_filename_of_current_file_with_line_no()
  -- this gets the absolute path of the currently open buffer.
  -- local current_filename = vim.api.nvim_buf_get_name(0)

  -- whereas this gets the path of the currently open buffer relative to the root of the project.
  local current_filename = vim.fn.expand("%")

  local line_number, c = unpack(vim.api.nvim_win_get_cursor(0))

  local thing = current_filename .. ":" .. line_number

  -- set the value of the "+" register, which is synchronised with the system clipboard.
  vim.fn.setreg("+", thing)

  print("The system clipboard has been set to the relative path of the currently open buffer. \n (" .. thing .. ")")
end

vim.keymap.set(
  "n",
  "<leader>zy",
  "<cmd>lua yank_filename_of_current_file()<CR>",
  { desc = "Yank the filename of the currently open buffer", noremap = true, silent = true }
)

vim.keymap.set(
  "n",
  "<leader>zz",
  "<cmd>lua yank_filename_of_current_file_with_line_no()<CR>",
  { desc = "Yank the filename of the currently open buffer with line number", noremap = true, silent = true }
)
