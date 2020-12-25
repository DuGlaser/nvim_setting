vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'gruvbox-community/gruvbox'
  use 'machakann/vim-sandwich'
  use 'christoomey/vim-tmux-navigator'
  use {
    'akinsho/nvim-bufferline.lua',
    requires = {
      {'kyazdani42/nvim-web-devicons'},
    }
  }
  use {
    'mattn/emmet-vim',
    cmd = 'EmmetInstall',
    opt = true
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() vim.cmd [[TSUpdate]] end
  }

  -- fern
  use 'lambdalisue/fern.vim'
  use 'lambdalisue/fern-hijack.vim'
  use 'hrsh7th/fern-mapping-collapse-or-leave.vim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/glyph-palette.vim'
end)
