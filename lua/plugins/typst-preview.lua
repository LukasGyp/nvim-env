return {
  'chomosuke/typst-preview.nvim',
  ft = 'typst',
  version = '1.*',
  opts = {
    open_cmd = 'google-chrome --app=%s --user-data-dir=/tmp/typstpreview-profile',
  },

}
