return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        clojure = {
          "clj-kondo",
        },
      },
    },
  },
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clj-kondo",
        "clojure-lsp",
      },
    },
  },
}
