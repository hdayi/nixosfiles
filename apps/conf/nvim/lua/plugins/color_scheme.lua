return {

  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = true,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "hard", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = true,
      transparent_mode = true,
      gruvbox_italic_comments = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
