return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  dependencies = {
    { "AstroNvim/astroui", opts = { icons = { Trouble = "󱍼" } } },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        -- local function project_filter(item)
        --   -- 获取当前工作目录 (CWD)
        --   local cwd = (vim.uv or vim.loop).cwd() or vim.fn.getcwd()
        --   -- 如果 item 有文件名，并且包含了 cwd 路径，则保留它
        --   return item.filename and item.filename:find(cwd, 1, true) ~= nil
        -- end
        -- maps.n["<Leader>lc"] = { "<Cmd>Trouble lsp toggle win.position=left focus=true<CR>", desc = "Lsp" }
        local prefix = "<Leader>x"
        -- maps.n[prefix .. "a"] = {
        --   function()
        --     require("trouble").toggle {
        --       Mode = "lsp",
        --       position = "bottom",
        --       focus = true,
        --       filter = project_filter,
        --     }
        --   end,
        -- }
        maps.n[prefix .. "a"] = { "<Cmd>Trouble lsp toggle<CR>", desc = "Trouble Lsp All" }
        maps.n[prefix .. "i"] =
          { "<Cmd>Trouble lsp_incoming_calls toggle filter.buf=0<CR>", desc = "Trouble Lsp Incoming Calls" }
        maps.n[prefix .. "o"] =
          { "<Cmd>Trouble lsp_outgoing_calls toggle filter.buf=0<CR>", desc = "Trouble Lsp Outgoing Calls" }
        maps.n[prefix .. "r"] =
          { "<Cmd>Trouble lsp_references toggle filter.buf=0<CR>", desc = "Trouble Lsp References" }
        maps.n[prefix .. "d"] =
          { "<Cmd>Trouble lsp_definitions toggle filter.buf=0<CR>", desc = "Trouble Lsp Definitions" }
        maps.n[prefix .. "s"] =
          { "<Cmd>Trouble lsp_document_symbols toggle filter.buf=0<CR>", desc = "Trouble Lsp Document Symbols" }
        maps.n[prefix .. "c"] =
          { "<Cmd>Trouble lsp_declarations toggle filter.buf=0<CR>", desc = "Trouble Lsp Declarations" }
        maps.n[prefix .. "p"] =
          { "<Cmd>Trouble lsp_implementations toggle filter.buf=0<CR>", desc = "Trouble Lsp Implementations" }
        maps.n[prefix .. "t"] =
          { "<Cmd>Trouble lsp_type_definitions toggle filter.buf=0<CR>", desc = "Trouble Lsp Type Definitions" }
        maps.n[prefix .. "X"] = { "<Cmd>Trouble diagnostics toggle<CR>", desc = "Trouble Workspace Diagnostics" }
        maps.n[prefix .. "x"] =
          { "<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Trouble Document Diagnostics" }
        maps.n[prefix .. "L"] = { "<Cmd>Trouble loclist toggle<CR>", desc = "Trouble Location List" }
        maps.n[prefix .. "Q"] = { "<Cmd>Trouble quickfix toggle<CR>", desc = "Trouble Quickfix List" }
        if require("astrocore").is_available "todo-comments.nvim" then
          -- maps.n[prefix .. "t"] = { "<cmd>Trouble todo<cr>", desc = "Trouble Todo" }
          maps.n[prefix .. "T"] =
            { "<cmd>Trouble todo toggle filter={tag={TODO,FIX,FIXME}}<cr>", desc = "Trouble Todo/Fix/Fixme" }
        end
      end,
    },
  },
  opts = function()
    local get_icon = require("astroui").get_icon
    local lspkind_avail, lspkind = pcall(require, "lspkind")
    local project_filter = {
      any = {
        {
          function(item) return item.filename and item.filename:find((vim.loop or vim.uv).cwd(), 1, true) end,
        },
      },
    }
    return {
      modes = {
        lsp = {
          mode = "lsp",
          position = "right",
          focus = true,
          filter = project_filter,
          format = "{file_icon}{basename:Title}{pos}{text:Comment}",
        },
      },
      keys = {
        ["<ESC>"] = "close",
        ["q"] = "close",
        ["<C-E>"] = "close",
      },
      icons = {
        indent = {
          fold_open = get_icon "FoldOpened",
          fold_closed = get_icon "FoldClosed",
        },
        folder_closed = get_icon "FolderClosed",
        folder_open = get_icon "FolderOpen",
        kinds = lspkind_avail and lspkind.symbol_map or nil,
      },
    }
  end,
  specs = {
    { "lewis6991/gitsigns.nvim", optional = true, opts = { trouble = true } },
    {
      "folke/edgy.nvim",
      optional = true,
      opts = function(_, opts)
        if not opts.bottom then opts.bottom = {} end
        table.insert(opts.bottom, "Trouble")
      end,
    },
    {
      "folke/snacks.nvim",
      optional = true,
      opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts or {}, {
          picker = {
            actions = require("trouble.sources.snacks").actions,
            win = {
              input = {
                keys = {
                  ["<c-t>"] = {
                    "trouble_open",
                    mode = { "n", "i" },
                  },
                },
              },
            },
          },
        })
      end,
    },
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { lsp_trouble = true } },
    },
  },
}
