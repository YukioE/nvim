return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- Load before other plugins to set colorscheme
  config = function()
    require('catppuccin').setup {
      flavour = 'macchiato', -- Set the default flavour to macchiato
      background = {
        light = 'latte',
        dark = 'macchiato',
      },
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
      },
      custom_highlights = function(colors)
        return {}
      end,
    }
    vim.cmd.colorscheme 'catppuccin' -- Apply the colorscheme
  end,
}
