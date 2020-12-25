vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'gruvbox-community/gruvbox'
  use 'machakann/vim-sandwich'
  use 'christoomey/vim-tmux-navigator'
  use {'neoclide/coc.nvim', run = 'yarn install --frozen-lockfile'}
  use {
    'akinsho/nvim-bufferline.lua',
    requires = {
      {'kyazdani42/nvim-web-devicons'},
    }
  }
  use 'SirVer/ultisnips'
  use {
    'mattn/emmet-vim',
    cmd = 'EmmetInstall',
    opt = true
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
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
  use 'romgrk/equal.operator'
  use 'rhysd/clever-f.vim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use {
    'kana/vim-operator-replace',
    requires = {
      {'kana/vim-operator-user'}
    },
    config = function() vim.cmd('map <Space>s <Plug>(operator-replace)') end
  }
  use {
    't9md/vim-choosewin',
    config = function() vim.cmd('nmap  -  <Plug>(choosewin)') end
  }
  use 'lambdalisue/gina.vim'
  use {
    'itchyny/vim-parenmatch',
    config = function() vim.g.loaded_matchparen = 1 end
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end
  }
  use {
    'thinca/vim-zenspace',
    config = function() vim.cmd("let g:zenspace#default_mode = 'on'") end
  }
  use {
    'machakann/vim-highlightedyank',
    config = function() vim.g.highlightedyank_highlight_duration = 200 end
  }

  -- fern
  use 'lambdalisue/fern.vim'
  use 'lambdalisue/fern-hijack.vim'
  use 'hrsh7th/fern-mapping-collapse-or-leave.vim'
  use 'lambdalisue/fern-renderer-nerdfont.vim'
  use 'lambdalisue/nerdfont.vim'
  use 'lambdalisue/glyph-palette.vim'
end)

-- vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')
