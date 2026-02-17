return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = '1.*',
  opts = {
    open_cmd = string.format(
      'google-chrome --app=%%s --user-data-dir=%s/.cache/typstpreview-profile --ozone-platform=wayland 2>/dev/null',
      vim.fn.expand("~")
    ),
  },
}
