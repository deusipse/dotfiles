local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "rebelot/kanagawa.nvim"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins.configs.indent"
    end
  }
  use "nvim-tree/nvim-web-devicons"
  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "plugins.configs.lualine"
    end
  }
  use {
    "nvim-telescope/telescope.nvim", tag = "0.1.1",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require "plugins.configs.telescope"
    end
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make"
  }
  use {
    "goolord/alpha-nvim",
    config = function()
      require "plugins.configs.alpha"
    end
  }
  use {
    "lervag/vimtex",
    config = function()
      vim.opt.conceallevel = 2
      vim.g.tex_conceal = "abdmgs"
      vim.g.vimtex_view_method = "zathura"
    end
  }
  use {
    "sirver/ultisnips",
    config = function()
      vim.g.UltiSnipsExpandTrigger = "<tab>"
      vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
    end
  }
  use {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "plugins.configs.nvimtree"
    end
  }
  use {
    "akinsho/bufferline.nvim",
    config = function()
      require "plugins.configs.bufferline"
    end
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require "plugins.configs.autopairs"
    end
  }
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  }
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
    end
  }
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require "plugins.configs.toggleterm"
    end
  }
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "quangnguyen30192/cmp-nvim-ultisnips" },
    },
    config = function()
      require "plugins.configs.cmp"
    end
  }
  if packer_bootstrap then
    require("packer").sync()
  end
end)
