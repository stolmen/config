-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.env.PATH = "/opt/homebrew/bin:/opt/homebrew/sbin:" .. vim.env.PATH

-- vim.g["conjure#client#python#stdio#command"] = "poetry run python -iq"
-- vim.g["conjure#mapping#doc_word"] = "gk"
--

-- require("olical/conjure").setup({
--   output = {
--     to = "split",
--     split = "botright", -- Open split at the bottom
--   },
-- })
