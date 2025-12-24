vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps --
---------------------

-- Exit insert mode with jk
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Save file with Ctrl+s (works in normal and insert mode)
keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Quit with Ctrl+q
keymap.set("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit" })

-- Select all with Ctrl+a
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Better up/down navigation (handles wrapped lines)
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move down" })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move up" })

-- Move to beginning/end of line (more ergonomic)
keymap.set({ "n", "v" }, "H", "^", { desc = "Go to beginning of line" })
keymap.set({ "n", "v" }, "L", "$", { desc = "Go to end of line" })

-- Keep cursor centered when scrolling
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Keep cursor centered when searching
keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Better paste (don't lose clipboard when pasting over text)
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without losing clipboard" })

-- Delete to void register (don't yank when deleting)
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Copy to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

----------------------
-- Visual Mode Maps --
----------------------

-- Move lines up/down with J/K
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Stay in indent mode
keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

--------------------
-- Window Management --
--------------------

-- Better window navigation (Ctrl + h/j/k/l)
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows with arrow keys
keymap.set("n", "<Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Split windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

--------------------
-- Tab Management --
--------------------

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Quick tab navigation with Alt + number
keymap.set("n", "<A-1>", "1gt", { desc = "Go to tab 1" })
keymap.set("n", "<A-2>", "2gt", { desc = "Go to tab 2" })
keymap.set("n", "<A-3>", "3gt", { desc = "Go to tab 3" })
keymap.set("n", "<A-4>", "4gt", { desc = "Go to tab 4" })
keymap.set("n", "<A-5>", "5gt", { desc = "Go to tab 5" })

--------------------
-- Buffer Management --
--------------------

-- Navigate between buffers
keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close current buffer" })

--------------------
-- Quick Fixes --
--------------------

-- Better join (keep cursor in place)
keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

-- Undo break points (so you can undo parts of insert mode)
keymap.set("i", ",", ",<C-g>u", { desc = "Undo break point" })
keymap.set("i", ".", ".<C-g>u", { desc = "Undo break point" })
keymap.set("i", "!", "!<C-g>u", { desc = "Undo break point" })
keymap.set("i", "?", "?<C-g>u", { desc = "Undo break point" })
