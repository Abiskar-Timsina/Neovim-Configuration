-- Syntax highlighting
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  event = { "BufReadPost", "BufNewFile" },

  opts = {
    ensure_installed = { "lua", "go", "python", "php", "c" },
    auto_install = false,
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
