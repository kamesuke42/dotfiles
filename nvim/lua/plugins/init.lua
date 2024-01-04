return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        integrations = {
          fidget = true,
          gitsigns = true,
          mason = true,
          cmp = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "underline" },
              warnings = { "underline" },
              information = { "underline" },
            },
            inlay_hints = {
              background = true,
            },
          },
          treesitter = true,
          telescope = {
            enabled = true,
          },
          lsp_trouble = true,
        },
      })
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      local lsp_names = function()
        local clients = {}
        for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
          table.insert(clients, client.name)
        end
        return "Lsp: " .. table.concat(clients, ", ")
      end
      require("lualine").setup({
        options = {
          theme = "catppuccin",
        },
        sections = {
          lualine_c = { "filename", lsp_names },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "[F]ind [F]iles" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "[F]uzzy [G]rep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "[F]uzzy [B]uffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "[F]uzzy [H]elps" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "[F]uzzy [O]ldfiles" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "[F]uzzy [K]eymaps" },
    },
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    event = "InsertEnter",
    config = function()
      local luasnip = require("luasnip")
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete({}),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPost",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
    },
    config = function()
      local servers = {}
      local mason_lspconfig = require("mason-lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason").setup()
      require("neodev").setup()
      require("trouble").setup()
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true })

      mason_lspconfig.setup({
        capabilities = capabilities,
        ensure_installed = servers,
      })
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set("n", "<space>wl", function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<space>df", function()
          vim.lsp.buf.format({ async = true })
        end, bufopts)
      end

      local lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
      }

      require("lspconfig").ruby_ls.setup{}

      mason_lspconfig.setup_handlers({
        function(server_name)
          if server_name ~= "" then
            require("lspconfig")[server_name].setup({
              on_attach = on_attach,
              flags = lsp_flags,
              capabilities = capabilities,
            })
          end
        end,
        ["denols"] = function()
          require("lspconfig").denols.setup({
            on_attach = on_attach,
            root_dir = require("lspconfig").util.root_pattern("deno.json", "deno.jsonc"),
            init_options = {
              lint = true,
            },
          })
        end,
        ["tsserver"] = function()
          require("lspconfig").tsserver.setup({
            on_attach = on_attach,
            root_dir = require("lspconfig").util.root_pattern("package.json"),
            single_file_support = false,
            init_options = {
              lint = true,
            },
          })
        end,
        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup({
            on_attach = on_attach,
            flags = lsp_flags,
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  checkThirdParty = false,
                },
              },
            },
          })
        end,
      })
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    event = "BufReadPost",
    config = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()

      require("nvim-treesitter.configs").setup({
        ensure_installed = {},
        autotag = {
          enable = true,
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPost",
    config = function()
      require("gitsigns").setup({
        on_attach = function()
          vim.keymap.set("n", "<leader>hs", '<cmd>lua require"gitsigns".stage_hunk()<cr>', { silent = true })
          vim.keymap.set("n", "<leader>hr", '<cmd>lua require"gitsigns".reset_hunk()<cr>', { silent = true })
          vim.keymap.set("n", "<leader>hp", '<cmd>lua require"gitsigns".preview_hunk()<cr>', { silent = true })
          vim.keymap.set("n", "]c", '<cmd>lua require"gitsigns".next_hunk()<cr>', { silent = true })
          vim.keymap.set("n", "[c", '<cmd>lua require"gitsigns".previous_hunk()<cr>', { silent = true })
        end,
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "BufReadPre",
    config = function()
      require("fidget").setup({})
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require("dressing").setup({})
    end,
  },
  {
    "RaafatTurki/hex.nvim",
    config = function()
      require("hex").setup()
    end,
  },
  {
    "vim-denops/denops.vim",
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "<leader>-", require("oil").open, { desc = "Open parent directory" })
    end,
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "lambdalisue/gin.vim",
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
        },
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          conform.format({ bufnr = args.buf })
        end,
      })
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
  {
    "hrsh7th/nvim-insx",
    config = function()
      require("insx.preset.standard").setup()
      local insx = require("insx")
      insx.add(
        "'",
        insx.with(
          require("insx.recipe.auto_pair")({
            open = "'",
            close = "'",
          }),
          {
            insx.with.in_string(false),
            insx.with.in_comment(false),
            insx.with.nomatch([[\\\%#]]),
            insx.with.nomatch([[\a\%#]]),
          }
        )
      )
    end,
  },
}
