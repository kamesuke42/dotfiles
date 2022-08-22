require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "c",
    "commonlisp",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "html",
    "java",
    "javascript",
    "json",
    "llvm",
    "lua",
    "markdown",
    "php",
    "python",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
    "zig"
  },
  sync_isntall = true,
  highlight = {
    enable = true
  },
  autotag = {
    enable = true
  }
}
