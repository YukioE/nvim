return {
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({
      '*', -- Enable for all file types
    }, {
      RGB = true, -- Enable #RGB hex codes
      RRGGBB = true, -- Enable #RRGGBB hex codes
      names = true, -- Enable "name" colors like Blue or Gray
      RRGGBBAA = true, -- Enable #RRGGBBAA hex codes
      rgb_fn = true, -- Enable CSS rgb() and rgba() functions
      hsl_fn = true, -- Enable CSS hsl() and hsla() functions
      css = true, -- Enable all CSS features (includes RGB, RRGGBB, names, rgb_fn, hsl_fn)
      css_fn = true, -- Enable all CSS *functions* (rgb_fn and hsl_fn)
      mode = 'background', -- Display colors in the background
    })
  end,
}
