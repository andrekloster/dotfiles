return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<leader>bh", "<cmd>BufferLineMovePrev<cr>", desc = "Move Prev Buffer" },
    { "<leader>bl", "<cmd>BufferLineMoveNext<cr>", desc = "Move Next Buffer" },
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Prev Buffer" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Next Buffer" },
  },
}
