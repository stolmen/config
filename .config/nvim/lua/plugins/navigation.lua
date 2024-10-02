local find_files_with_hidden_and_no_ignore = function()
  local action_state = require("telescope.actions.state")
  local line = action_state.get_current_line()
  LazyVim.pick("find_files", { no_ignore = true, hidden = true, default_text = line })()
end

local actions = require("telescope.actions")

-- local function find_files_hack()
--   return {
--     "rg",
--     "--files",
--     "--color",
--     "never",
--     "-g",
--     "!.git",
--     -- "-g", "**/*.env*", "--hidden"
--   }
-- end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fw",
        function()
          local utils = require("neo-tree.utils")
          local curr_buff_full_path = vim.api.nvim_buf_get_name(0)
          local parent, _ = utils.split_path(curr_buff_full_path)
          require("neo-tree.command").execute({ toggle = true, dir = parent })
        end,
        desc = "neotree current file dir",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    -- keys = {
    --   { "<leader>fd", LazyVim.pick("find_files"), desc = "Find Files (Root Dir hack)" },
    -- },

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
        -- pickers = {
        --   find_files = {
        --     find_command = find_files_hack,
        --     -- hidden = true,
        --   },
        -- },
      })

      -- then load the extension
      telescope.load_extension("live_grep_args")

      -- Then invoke with a custom keymap
      vim.keymap.set(
        "n",
        "<leader>fz",
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        { desc = "Grep w/ options (Root Dir)" }
      )

      -- local telescope = require("telescope.builtin")

      -- Create a custom function to find .env files
      function find_env_files_uniquelalala()
        local builtin = require("telescope.builtin")
        builtin.find_files({
          prompt_title = "< .env Files >",
          cwd = vim.fn.expand("%:p:h"), -- Start from the current directory
          find_command = { "rg", "--files", "--glob", "**/*.env*", "--hidden", "--no-ignore" },
        })
      end

      -- Map the custom function to a key
      vim.api.nvim_set_keymap(
        "n",
        "<leader>fd",
        "<cmd>lua find_env_files_uniquelalala()<CR>",
        { noremap = true, silent = true }
      )
    end,
  },
}
