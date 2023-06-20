return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      override = {
        ["cmp.entry.get_documentation"] = true,
      },
    },
  },
}
