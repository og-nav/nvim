-- Git Conflict: Better git conflict resolution
return {
  "akinsho/git-conflict.nvim",
  version = "*",
  event = "BufReadPost",
  config = function()
    require("git-conflict").setup({
      default_mappings = true, -- disable buffer local mapping created by this plugin
      default_commands = true, -- disable commands created by this plugin
      disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
      list_opener = "copen", -- command or function to open the conflicts list
      highlights = {
        incoming = "DiffAdd",
        current = "DiffText",
      },
    })

    -- Additional keymaps
    vim.keymap.set("n", "<leader>gco", "<cmd>GitConflictChooseOurs<CR>", { desc = "Git Conflict: Choose Ours" })
    vim.keymap.set("n", "<leader>gct", "<cmd>GitConflictChooseTheirs<CR>", { desc = "Git Conflict: Choose Theirs" })
    vim.keymap.set("n", "<leader>gcb", "<cmd>GitConflictChooseBoth<CR>", { desc = "Git Conflict: Choose Both" })
    vim.keymap.set("n", "<leader>gc0", "<cmd>GitConflictChooseNone<CR>", { desc = "Git Conflict: Choose None" })
    vim.keymap.set("n", "<leader>gcn", "<cmd>GitConflictNextConflict<CR>", { desc = "Git Conflict: Next" })
    vim.keymap.set("n", "<leader>gcp", "<cmd>GitConflictPrevConflict<CR>", { desc = "Git Conflict: Previous" })
    vim.keymap.set("n", "<leader>gcl", "<cmd>GitConflictListQf<CR>", { desc = "Git Conflict: List All" })
  end,
}

