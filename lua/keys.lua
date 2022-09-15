vim.g.mapleader = " "

--map("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true }) -- Range through code actions
vim.api.nvim_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", {})
vim.api.nvim_set_keymap("n", "H", ":bprev<CR>", {})
vim.api.nvim_set_keymap("n", "L", ":bnext<CR>", {})

local wk = require("which-key")

wk.register({
  g = {
    name = "Goto", -- optional group name
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto definition" }, 
    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
    c = { "<cmd>lua vim.lsp.buf.incoming_calls()<CR>", "Goto Incoming calls" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Typedef" },
    r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Goto References" },
    h = { "<cmd>Lspsaga lsp_finder<CR>", "Show LSP Finder" },
  },
  ["<leader>"] = {
    e = { ":NvimTreeToggle<CR>", "Open Tree" },
    s = {
      name = "Show Symbols",
      d = { "<cmd>lua vim.lsp.buf.document_symbol()<CR>", "Document" },
      w = { "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "Workspace" },
    },
    c = {
      name = "Code",
      a = { "<cmd>Lspsaga code_action<CR>", "Display code action menu" },
      r = { "<cmd>Lspsaga rename<CR>", "Rename Symbol" },
      p = { "<cmd>Lspsaga preview_definition<CR>", "Preview Definition" },
    },
    d = {
      name = "Debug",
      b = { "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
      o = {"<Cmd>lua require'dap'.step_over()<CR>", "Step Over" },
      i = {"<Cmd>lua require'dap'.step_into()<CR>", "Step Into" },
      c = {"<Cmd>lua require'dap'.continue()<CR>", "Continue" },
  },
  b = {
    name = "Buffer",
    d = { "<cmd>NvimTreeClose<CR><cmd>bdelete<CR>", "Delete buffer"},
  },
  f = {
    name = "Telescope",
    f = { "<cmd>Telescope find_files<cr>", "Find Files"},
    g = { "<cmd>Telescope live_grep<cr>", "Live GREP"},
    b = { "<cmd>Telescope buffers<cr>", "Find Buffers"},
    h = { "<cmd>Telescope help_tags<cr>", "Help Tags"},
  },
  g = {
	  name = "Git",
	  b = {"<cmd>GitBlameToggle<cr>", "Toggle Git Blame"},
	  o = {"<cmd>Neogit<cr>"},
  }
  },
})
