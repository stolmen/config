return {
  {
    "folke/snacks.nvim",
    opts = {
      -- global UI options
      ui = {
        border = "rounded",
      },
      scroll = {
        animate = {
          duration = { step = 15, total = 100 }, -- default scrolling speed too damn slow, so speed it up a bit
          -- duration = { step = 15, total = 250 },
          easing = "linear",
        },
        animate_repeat = {
          delay = 100, -- ms before using repeat animation
          duration = { step = 5, total = 50 },
          easing = "linear",
        },
        filter = function(buf) -- what buffers to animate
          return vim.g.snacks_scroll ~= false
            and vim.b[buf].snacks_scroll ~= false
            and vim.bo[buf].buftype ~= "terminal"
        end,
      },
    },
  },
}
