return {
  'numToStr/Comment.nvim',
  event = {
    "BufRead",
    "BufNewFile"
  },
  opts = {},
  config = function()
    require("Comment").setup()
  end,
}
