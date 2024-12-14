return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- Load before other plugins to set colorscheme
  config = function()
    -- Configure Catppuccin with the latte flavor for light and macchiato for dark
    require('catppuccin').setup {
      flavour = 'latte', -- Set the default flavour to latte
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
        return {
          TelescopeBorder = { fg = colors.base, bg = colors.base },
          TelescopePreviewBorder = { fg = colors.base, bg = colors.base },
          TelescopeResultsBorder = { fg = colors.base, bg = colors.base },
          TelescopePromptBorder = { fg = colors.base, bg = colors.base },
        }
      end,
    }

    -- Apply the Catppuccin colorscheme after configuring
    vim.cmd.colorscheme 'catppuccin'
    vim.cmd [[highlight Visual cterm=NONE gui=NONE]]
  end,
}
