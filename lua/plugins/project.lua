return {
  'coffebar/neovim-project',
  opts = {
    projects = {
      '~/basereality22/',
      '~/Documents/MEGA/studium/*',
      '~/Documents/MEGA/SYNC/Programmieren/*',
      '~/',
    },
    picker = {
      type = 'telescope',
    },
  },
  init = function()
    vim.opt.sessionoptions:append 'globals'
  end,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
    { 'ibhagwan/fzf-lua' },
    { 'Shatur/neovim-session-manager' },
  },
  lazy = false,
  priority = 100,
}
