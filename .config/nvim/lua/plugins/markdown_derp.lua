return {
  {
    -- modify the linter used by the markdown module to ignore certain things
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {
          "markdownlint",
          "proselint", -- also run this pretentious linter for the lols
        },
      },
      linters = {
        markdownlint = function()
          local filename = vim.api.nvim_buf_get_name(0) --note `0` means the current buffer.
          local efm = "%f:%l:%c %m,%f:%l %m"
          return {
            cmd = "markdownlint",
            ignore_exitcode = true,
            stream = "stderr",
            stdin = false, -- pass the filename as an argument
            append_fname = false, -- this doesn't work as expected - I need to form the arguments manually
            args = { filename, "--disable", "MD013" },
            parser = require("lint.parser").from_errorformat(efm, {
              source = "markdownlint",
              severity = vim.diagnostic.severity.WARN,
            }),
          }
        end,
      },
    },
  },
}
