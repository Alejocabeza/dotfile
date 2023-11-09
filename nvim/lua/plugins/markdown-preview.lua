return {
  "adalessa/markdown-preview.nvim",
  enabled = false,
  config = true,
  ft = "markdown",
  keys = {
    { "n", "<leader>mp", "<cmd>MarkdownPreview<cr>" },
    { "n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>" },
    { "n", "<leader>mr", "<cmd>MarkdownPreviewRefresh<cr>" },
  },
}
