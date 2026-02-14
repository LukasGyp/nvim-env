return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = '1.*',
  opts = {
    open_cmd = 'google-chrome --app=%s --user-data-dir=$HOME/.cache/typstpreview-profile --ozone-platform=x11 2>/dev/null',
  },

}
