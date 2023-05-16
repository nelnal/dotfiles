vim.cmd([[packadd packer.nvim]])

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- common
  use({
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  })

  -- colorscheme
  use({
    "folke/tokyonight.nvim",
  })

  use({
    "bluz71/vim-nightfly-colors",
    as = "nightfly",
  })

  -- aerial.nvim (for outline)
  use("stevearc/aerial.nvim")

  -- barbecue
  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    after = "nvim-web-devicons",
    config = function()
      require("barbecue").setup()
    end,
  })

  -- dap
  use({
    "mfussenegger/nvim-dap",
    "suketa/nvim-dap-ruby",
  })

  -- fidget
  use("j-hui/fidget.nvim")

  -- filer
  use("nvim-tree/nvim-tree.lua")

  -- gitlinker
  use("ruifm/gitlinker.nvim")

  -- indent-blackline
  use("lukas-reineke/indent-blankline.nvim")

  -- lualine (statusline)
  use("nvim-lualine/lualine.nvim")

  -- lspkind-nvim
  use("onsails/lspkind.nvim")

  -- lspsaga
  use("nvimdev/lspsaga.nvim")

  -- mason
  use({
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
  })

  -- null-ls
  use("jose-elias-alvarez/null-ls.nvim")

  -- nvim-cmp
  use({
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-copilot",
    "hrsh7th/nvim-cmp",

    -- snippets
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
  })

  -- nvim-highlight-colors
  use("brenoprata10/nvim-highlight-colors")

  -- nvim-treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    "RRethy/nvim-treesitter-endwise",
  })

  -- telescope
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
  })

  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  })

  -- toggleterm
  use("akinsho/toggleterm.nvim")

  -- trouble
  use({
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup({})
    end,
  })

  ----------------------------------------------
  -- for ruby
  use("tpope/vim-rails")

  --  for go
  use("leoluz/nvim-dap-go")
end)

-- base config

vim.cmd("autocmd!")

-- encodings
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"

-- line number
vim.o.number = true
-- vim.wo.relativenumber = true

vim.o.title = true

-- indent
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true
vim.o.showmatch = true
vim.o.laststatus = 2

-- appearance
vim.o.cursorline = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true

-- show <Tab> and <EOL>
vim.o.list = true
vim.o.listchars = "tab:>-,trail:-,eol:↲"

vim.o.autoread = true
vim.o.backspace = "indent,eol,start"
vim.o.completeopt = "menu,menuone,noinsert,preview"
vim.o.hidden = true
vim.o.nrformats = "alpha,octal,hex"
vim.o.showcmd = true
vim.o.swapfile = true
vim.o.termguicolors = true
vim.o.updatetime = 500
vim.o.swapfile = false
vim.o.whichwrap = "b,s,[,],<,>"
vim.o.wrap = true

vim.g.node_host_prog = "/Users/takashi.asaba/.anyenv/envs/nodenv/versions/18.15.0/bin/neovim-node-host"
vim.g.python3_host_prog = "/Users/takashi.asaba/.anyenv/envs/pyenv/versions/py3neovim/bin/python"
vim.g.ruby_host_prog = "/Users/takashi.asaba/.anyenv/envs/rbenv/versions/3.1.3/bin/neovim-ruby-host"

vim.g.nightflyTransparent = true

vim.cmd([[colorscheme nightfly]])

vim.g.mapleader = ","

vim.cmd([[
highlight IndentBlanklineIndent1 guibg=#241414 gui=nocombine
highlight IndentBlanklineIndent2 guibg=#241E14 gui=nocombine
highlight IndentBlanklineIndent3 guibg=#242414 gui=nocombine
highlight IndentBlanklineIndent4 guibg=#141c14 gui=nocombine
highlight IndentBlanklineIndent5 guibg=#142424 gui=nocombine
highlight IndentBlanklineIndent6 guibg=#141424 gui=nocombine
highlight IndentBlanklineIndent7 guibg=#1c141c gui=nocombine
]])

local lspkind = require("lspkind")
lspkind.init({
  -- defines how annotations are shown
  -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
  mode = "symbol_text",
  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = "default",
  -- override preset symbols
  --
  -- default: {}
  symbol_map = {},
})

-- completion
local cmp = require("cmp")
cmp.setup({
  -- completion = {
  -- autocomplete = false,
  -- },
  experimental = {
    ghost_text = false,
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol_text",
      maxwidth = 80, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      -- before = function(entry, vim_item)
      -- return vim_item
      -- end
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-l>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "copilot" },
    { name = "vsnip" },
    { name = "buffer" },
    { name = "path" },
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    -- { name = "path" },
    { name = "cmdline" },
  },
})

-- lsp
require("mason").setup()
require("mason-lspconfig").setup()
require("lspsaga").setup({})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = function(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  local opts = { noremap = true, silent = true }
  --[[
    vim.keymap.set("n", "<leader>dec", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>df", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>im", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>typ", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>rf", vim.lsp.buf.references, opts)
    ]]
  --
  vim.keymap.set("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<cr>", opts)
  vim.keymap.set("n", "<leader>ll", "<cmd>Lspsaga lsp_outline<cr>", opts)
  vim.keymap.set("n", "<leader>lin", "<cmd>Lspsaga lsp_incoming_calls<cr>", opts)
  vim.keymap.set("n", "<leader>lout", "<cmd>Lspsaga lsp_outgoing_calls<cr>", opts)
  vim.keymap.set("n", "<leader>K", "<cmd>Lspsaga hover_doc<cr>", opts)
  vim.keymap.set("n", "<leader>pdf", "<cmd>Lspsaga peek_definition<cr>", opts)
  vim.keymap.set("n", "<leader>df", "<cmd>Lspsaga goto_definition<cr>", opts)
  vim.keymap.set("n", "<leader>im", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>ptyp", "<cmd>Lspsaga peek_type_definition<cr>", opts)
  vim.keymap.set("n", "<leader>typ", "<cmd>Lspsaga goto_type_definition<cr>", opts)
  vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
  vim.keymap.set("n", "<leader>fmt", function()
    vim.lsp.buf.format({ async = true })
  end, opts)
  -- vim.cmd([[
  -- let s:bl = ['json'] " set blacklist filetype
  -- augroup lsp_document_highlight
  -- autocmd! * <buffer>
  -- autocmd CursorHold,CursorHoldI <buffer> if index(s:bl, &ft) < 0 | lua vim.lsp.buf.document_highlight()
  -- autocmd CursorMoved,CursorMovedI <buffer> if index(s:bl, &ft) < 0 | lua vim.lsp.buf.clear_references()
  -- augroup END
  -- ]])
  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = vim.api.nvim_create_augroup("LspDocumentHighlight", {}),
    pattern = "<buffer>",
    callback = function()
      vim.lsp.buf.document_highlight()
      vim.diagnostic.show()
    end,
  })
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    group = vim.api.nvim_create_augroup("LspDocumentHighlight", {}),
    pattern = "<buffer>",
    callback = function()
      vim.lsp.buf.clear_references()
    end,
  })
end

require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("UserBufWritePre", {}),
      callback = function(ev)
        vim.lsp.buf.format({ async = false })
      end,
    })
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = vim.api.nvim_create_augroup("UserBufWritePost", {}),
      callback = function()
        -- vim.diagnostic.show()
      end,
    })
  end,
  ["gopls"] = function()
    local util = require("lspconfig/util")
    require("lspconfig")["gopls"].setup({
      cmd = { "gopls", "serve" },
      capabilities = capabilities,
      filetypes = { "go", "gomod" },
      on_attach = on_attach,
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("UserGoplsBufWritePre", {}),
      pattern = "*.go",
      callback = function()
        vim.lsp.buf.code_action({
          context = { only = { "source.organizeImports" } },
          apply = true,
        })
      end,
    })
    vim.api.nvim_create_autocmd("BufWritePost", {
      group = vim.api.nvim_create_augroup("UserGoplsBufWritePost", {}),
      pattern = "*.go",
      callback = function()
        -- vim.diagnostic.show()
      end,
    })
  end,
})

local border = "single" -- single, rounded , none, shadow, double, solid
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
    format = function(diagnostic)
      return string.format("[%s] %s", diagnostic.source, diagnostic.message)
    end,
  },
  border = border,
})

--- ####  others  ####

require("aerial").setup({
  layout = {
    default_direction = "right",
  },
})

local dap = require("dap")
dap.configurations = {
  ruby = {
    {
      type = "ruby",
      requrest = "attach",
      name = "Attach to server",
      runtimeExecutable = "rdbg",
      runtimeArgs = { "--port", "12345" },
    },
    {
      type = "ruby",
      requrest = "launch",
      name = "Debug rspec",
      runtimeExecutable = "devcontainer exec --workspace-folder=. bundle exec rspec",
      -- runtimeArgs  = {"-b", "bundle", "exec", "rspec"},
    },
  },
}

require("dap-ruby").setup({})

require("fidget").setup({})

require("gitlinker").setup({})

require("indent_blankline").setup({
  char = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
    "IndentBlanklineIndent7",
  },
  space_char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
    "IndentBlanklineIndent7",
  },
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
})

require("lualine").setup({
  options = { theme = "papercolor_light" },
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.rubocop.with({
      condition = function(utils)
        return utils.root_has_file(".rubocop.yml")
      end,
    }),
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.completion.spell,
    null_ls.builtins.diagnostics.cspell.with({
      condition = function()
        -- cspellが実行できるときのみ有効
        -- return vim.fn.executable("cspell") > 0
      end,
      diagnostics_postprocess = function(diagnostic)
        -- レベルをWARNに変更（デフォルトはERROR）
        diagnostic.severity = vim.diagnostic.severity["WARN"]
      end,
    }),
    null_ls.builtins.diagnostics.rubocop.with({
      condition = function(utils)
        return utils.root_has_file(".rubocop.yml")
      end,
    }),
  },
})

require("nvim-tree").setup({
  filters = {
    dotfiles = false,
  },
  respect_buf_cwd = true,
  sort_by = "case_sensitive",
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
})

require("nvim-highlight-colors").setup({})

require("nvim-treesitter.configs").setup({
  endwise = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = {},
  },
})

local telescope = require("telescope")
telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", "vendor" },
    layout_strategy = "horizontal",
    layout_config = {
      mirror = true,
      prompt_position = "top",
    },
    mappings = {
      i = {
        ["<esc>"] = require("telescope.actions").close,
        ["<C-Down>"] = require("telescope.actions").cycle_history_next,
        ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
        ["<C-q>"] = require("telescope.actions").send_to_qflist,
      },
    },
    preview = {
      treesitter = true,
    },
    sorting_strategy = "ascending",
    winblend = 4,
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
})
telescope.load_extension("fzf")

require("toggleterm").setup({})

--  ####  autocmd   ####

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("UserBufWritePost", {}),
  callback = function()
    -- FIXME: 保存時に LSP diagnostics が消えるので、一旦バッファを閉じて再度開く
    -- どうも neovim のバグらしい

    -- TODO: relaod file with post position
    -- val = vim.api.nvim_win_get_cursor(0)
    -- vim.cmd([[edit!]])
  end,
})

--  ####  user commands ####
local telescopeBuiltin = require("telescope.builtin")

vim.api.nvim_create_user_command("TBuiltin", function(opts)
  telescopeBuiltin.builtin(opts)
end, {})

vim.api.nvim_create_user_command("TGitBranches", function(opts)
  telescopeBuiltin.git_branches(opts)
end, {})

vim.api.nvim_create_user_command("TGitCommits", function(opts)
  telescopeBuiltin.git_commits(opts)
end, {})

vim.api.nvim_create_user_command("TGitStatus", function(opts)
  telescopeBuiltin.git_status(opts)
end, {})

vim.api.nvim_create_user_command("TGitStash", function(opts)
  telescopeBuiltin.git_stash(opts)
end, {})

--  ####  key bindings  ####
local aerialapi = require("aerial")
local treeapi = require("nvim-tree.api")

-- diagnostics
vim.keymap.set("n", "<leader>sd", vim.diagnostic.show)
vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- lsp
--    look up LSP config

-- dap
vim.keymap.set("n", "<leader>br", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dl", dap.continue)
vim.keymap.set("n", "<leader>di", dap.step_into)
vim.keymap.set("n", "<leader>do", dap.step_over)
vim.keymap.set("n", "<leader>dr", dap.repl.open)

-- telescope fzf
vim.keymap.set("n", "<Leader>f", telescopeBuiltin.find_files, {})
vim.keymap.set("n", "<Leader>b", telescopeBuiltin.buffers, {})
vim.keymap.set("n", "<Leader>lg", telescopeBuiltin.live_grep, {})
vim.keymap.set("n", "<Leader>gs", telescopeBuiltin.grep_string, {})
vim.keymap.set("n", "<Leader>gs", telescopeBuiltin.grep_string, {})
vim.keymap.set("n", "<Leader>ll", telescopeBuiltin.loclist, {})
vim.keymap.set("n", "<Leader>qhis", telescopeBuiltin.quickfixhistory, {})
vim.keymap.set("n", "<Leader>old", telescopeBuiltin.oldfiles, {})
vim.keymap.set("n", "<Leader>ch", telescopeBuiltin.command_history, {})

-- navigate window
vim.keymap.set("n", "<space>e", treeapi.tree.toggle)
vim.keymap.set("n", "<space>o", aerialapi.toggle)
vim.keymap.set("n", "<space>t", "<cmd>TroubleToggle<CR>")

vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>")
vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal size=24<CR>")
vim.keymap.set("n", "<leader>tr", "<cmd>ToggleTerm direction=vertical size=100<CR>")

--  for ruby
require("dap-ruby").setup()

--  for go
require("dap-go").setup()