local find_files_with_hidden_and_no_ignore = function()
  local action_state = require("telescope.actions.state")
  local line = action_state.get_current_line()
  LazyVim.pick("find_files", { no_ignore = true, hidden = true, default_text = line })()
end

local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
  config = function()
    local telescope = require("telescope")

    -- first setup telescope
    telescope.setup({
      extensions = {
        live_grep_args = {
          auto_quoting = true,
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<a-h>"] = find_files_with_hidden_and_no_ignore,
            ["<C-j>"] = find_files_with_hidden_and_no_ignore,
            ["<S-Down>"] = actions.cycle_history_next,
            ["<S-Up>"] = actions.cycle_history_prev,
          },
        },
      },
    })

    -- then load the extension
    telescope.load_extension("live_grep_args")

    -- Then invoke with some custom keymaps
    vim.keymap.set(
      "n",
      "<leader>fz",
      "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      { desc = "Grep w/ options (Root Dir)" }
    )
  end,
}
