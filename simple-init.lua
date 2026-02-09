-- ============================================================================
-- LEADER KEYS
-- ============================================================================

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================================
-- BASIC SETTINGS
-- ============================================================================

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true
opt.cursorline = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- Scrolling
opt.scrolloff = 10
opt.sidescrolloff = 8

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Visual settings
opt.termguicolors = true
opt.background = "light"
opt.signcolumn = "yes"
opt.colorcolumn = "100"
opt.showmatch = true
opt.matchtime = 2
opt.cmdheight = 1
opt.completeopt = "menuone,noinsert,noselect"
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.conceallevel = 0
opt.concealcursor = ""
opt.lazyredraw = true
opt.synmaxcol = 300
opt.fillchars = { eob = " " }

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

-- File handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.updatetime = 300
opt.timeoutlen = 500
opt.ttimeoutlen = 0
opt.autoread = true
opt.autowrite = false

-- Behavior settings
opt.hidden = true
opt.errorbells = false
opt.autochdir = false
opt.iskeyword:append("-")
opt.path:append("**")
opt.selection = "exclusive"
opt.mouse = "a"
opt.modifiable = true
opt.encoding = "UTF-8"

-- Cursor settings
opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Folding settings (works with treesitter if available, otherwise uses syntax)
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99

-- Command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Better diff options
opt.diffopt:append("linematch:60")

-- Performance improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- Netrw settings
vim.cmd("let g:netrw_liststyle = 3")

-- ============================================================================
-- THEME & TRANSPARENCY (optional, comment out if not needed)
-- ============================================================================

vim.cmd.colorscheme("sorbet") -- built-in colorscheme (also try: wildcharm, sorbet, habermax)

-- Transparency settings (uncomment if you want transparent background)
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
-- vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
-- vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
-- vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
-- vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
-- vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })

-- ============================================================================
-- KEY MAPPINGS
-- ============================================================================

local keymap = vim.keymap

-- Exit insert mode with jk
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Save and quit shortcuts
keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
keymap.set("n", "<C-q>", "<cmd>q<CR>", { desc = "Quit" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Better up/down navigation (handles wrapped lines)
keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move down" })
keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move up" })

-- Move to beginning/end of line
keymap.set({ "n", "v" }, "H", "^", { desc = "Go to beginning of line" })
keymap.set({ "n", "v" }, "L", "$", { desc = "Go to end of line" })

-- Keep cursor centered when scrolling
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Keep cursor centered when searching
keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Keep cursor centered when jumping to top/bottom
keymap.set("n", "gg", "ggzz", { desc = "Go to top and center" })
keymap.set("n", "G", "Gzz", { desc = "Go to bottom and center" })

-- Better paste (don't lose clipboard when pasting over text)
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without losing clipboard" })

-- Delete to void register (don't yank when deleting)
keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Copy to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Move lines up/down in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Move lines up/down in normal mode
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- Stay in indent mode
keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better J behavior (join lines without moving cursor)
keymap.set("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

-- Undo break points (so you can undo parts of insert mode)
keymap.set("i", ",", ",<C-g>u", { desc = "Undo break point" })
keymap.set("i", ".", ".<C-g>u", { desc = "Undo break point" })
keymap.set("i", "!", "!<C-g>u", { desc = "Undo break point" })
keymap.set("i", "?", "?<C-g>u", { desc = "Undo break point" })

-- ============================================================================
-- WINDOW MANAGEMENT
-- ============================================================================

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows with arrow keys
keymap.set("n", "<Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Alternative resize with Ctrl
keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Split windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- ============================================================================
-- TAB MANAGEMENT
-- ============================================================================

-- Tab display settings
opt.showtabline = 1

-- Basic tab operations
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- Tab navigation (added from example)
keymap.set("n", "<leader>tm", "<cmd>tabmove<CR>", { desc = "Move tab" })
keymap.set("n", "<leader>t>", "<cmd>tabmove +1<CR>", { desc = "Move tab right" })
keymap.set("n", "<leader>t<", "<cmd>tabmove -1<CR>", { desc = "Move tab left" })

-- Quick tab navigation with Alt + number
keymap.set("n", "<A-1>", "1gt", { desc = "Go to tab 1" })
keymap.set("n", "<A-2>", "2gt", { desc = "Go to tab 2" })
keymap.set("n", "<A-3>", "3gt", { desc = "Go to tab 3" })
keymap.set("n", "<A-4>", "4gt", { desc = "Go to tab 4" })
keymap.set("n", "<A-5>", "5gt", { desc = "Go to tab 5" })

-- Function to duplicate current tab
local function duplicate_tab()
  local current_file = vim.fn.expand('%:p')
  if current_file ~= '' then
    vim.cmd('tabnew ' .. current_file)
  else
    vim.cmd('tabnew')
  end
end

-- Function to close tabs to the right
local function close_tabs_right()
  local current_tab = vim.fn.tabpagenr()
  local last_tab = vim.fn.tabpagenr('$')
  for i = last_tab, current_tab + 1, -1 do
    vim.cmd(i .. 'tabclose')
  end
end

-- Function to close tabs to the left
local function close_tabs_left()
  local current_tab = vim.fn.tabpagenr()
  for i = current_tab - 1, 1, -1 do
    vim.cmd('1tabclose')
  end
end

keymap.set('n', '<leader>td', duplicate_tab, { desc = 'Duplicate current tab' })
keymap.set('n', '<leader>tr', close_tabs_right, { desc = 'Close tabs to the right' })
keymap.set('n', '<leader>tL', close_tabs_left, { desc = 'Close tabs to the left' })

-- ============================================================================
-- BUFFER MANAGEMENT
-- ============================================================================

-- Navigate between buffers
keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close current buffer" })

-- Close all buffers except current
keymap.set('n', '<leader>bo', ':%bd|e#|bd#<CR>', { desc = 'Close all buffers except current' })

-- Smart close buffer/tab
local function smart_close_buffer()
  local buffers_in_tab = #vim.fn.tabpagebuflist()
  if buffers_in_tab > 1 then
    vim.cmd('bdelete')
  else
    vim.cmd('tabclose')
  end
end
keymap.set('n', '<leader>bd', smart_close_buffer, { desc = 'Smart close buffer/tab' })

-- ============================================================================
-- FILE NAVIGATION
-- ============================================================================

-- Quick file navigation
keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { desc = "Open file explorer" })
keymap.set("n", "<leader>ff", "<cmd>find ", { desc = "Find file" })

-- Quick config editing
keymap.set("n", "<leader>rc", "<cmd>e $MYVIMRC<CR>", { desc = "Edit config" })
keymap.set("n", "<leader>rl", "<cmd>so $MYVIMRC<CR>", { desc = "Reload config" })

-- ============================================================================
-- FILE PATH UTILITIES
-- ============================================================================

-- Copy full file path
keymap.set("n", "<leader>pa", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Full path: " .. path)
end, { desc = "Copy full file path" })

keymap.set('n', '<leader>pf', function()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  print('Full path: ' .. path)
end, { desc = 'Copy full file path' })

keymap.set('n', '<leader>pr', function()
  local path = vim.fn.expand('%')
  vim.fn.setreg('+', path)
  print('Relative path: ' .. path)
end, { desc = 'Copy relative file path' })

-- Rename current file
keymap.set('n', '<leader>rr', function()
  local old_name = vim.fn.expand('%')
  local new_name = vim.fn.input('New file name: ', old_name)
  if new_name ~= '' and new_name ~= old_name then
    vim.cmd('saveas ' .. new_name)
    vim.fn.delete(old_name)
    print('File renamed to: ' .. new_name)
  end
end, { desc = 'Rename current file' })

-- ============================================================================
-- AUTOCOMMANDS
-- ============================================================================

local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    local line = mark[1]
    local ft = vim.bo.filetype
    if line > 0 and line <= lcount
      and vim.fn.index({ "commit", "gitrebase", "xxd" }, ft) == -1
      and not vim.o.diff then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Set filetype-specific settings
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "lua", "python" },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "javascript", "typescript", "json", "html", "css" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Auto-close terminal when process exits
vim.api.nvim_create_autocmd("TermClose", {
  group = augroup,
  callback = function()
    if vim.v.event.status == 0 then
      vim.api.nvim_buf_delete(0, {})
    end
  end,
})

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup,
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
  end,
})

-- Auto-resize splits when window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Create directories when saving files
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function()
    local dir = vim.fn.expand('<afile>:p:h')
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, 'p')
    end
  end,
})

-- ============================================================================
-- FLOATING TERMINAL
-- ============================================================================

local terminal_state = {
  buf = nil,
  win = nil,
  is_open = false
}

local function FloatingTerminal()
  -- If terminal is already open, close it (toggle behavior)
  if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
    return
  end

  -- Create buffer if it doesn't exist or is invalid
  if not terminal_state.buf or not vim.api.nvim_buf_is_valid(terminal_state.buf) then
    terminal_state.buf = vim.api.nvim_create_buf(false, true)
    vim.bo[terminal_state.buf].bufhidden = 'hide'
  end

  -- Calculate window dimensions
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create the floating window
  terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  -- Set window options
  vim.wo[terminal_state.win].winblend = 0

  -- Start terminal if not already running
  local has_terminal = false
  local lines = vim.api.nvim_buf_get_lines(terminal_state.buf, 0, -1, false)
  for _, line in ipairs(lines) do
    if line ~= "" then
      has_terminal = true
      break
    end
  end

  if not has_terminal then
    vim.fn.termopen(os.getenv("SHELL") or "bash")
  end

  terminal_state.is_open = true
  vim.cmd("startinsert")

  -- Set up auto-close on buffer leave
  vim.api.nvim_create_autocmd("BufLeave", {
    buffer = terminal_state.buf,
    callback = function()
      if terminal_state.is_open and vim.api.nvim_win_is_valid(terminal_state.win) then
        vim.api.nvim_win_close(terminal_state.win, false)
        terminal_state.is_open = false
      end
    end,
    once = true
  })
end

-- Terminal keymaps
keymap.set("n", "<leader>t", FloatingTerminal, { noremap = true, silent = true, desc = "Toggle floating terminal" })
keymap.set("t", "<Esc>", function()
  if terminal_state.is_open then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
  end
end, { noremap = true, silent = true, desc = "Close floating terminal from terminal mode" })

-- ============================================================================
-- SIMPLE STATUSLINE
-- ============================================================================

-- Simple statusline without Nerd Fonts (works everywhere)
vim.opt.statusline = " %f %h%m%r | %y %= %l:%c  %P "

-- ============================================================================
-- LSP KEYMAPS (only work if LSP is configured)
-- ============================================================================

-- These keymaps will only work if you have LSP servers installed
-- Comment out if you don't have LSP set up

-- LSP diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic list' })
keymap.set('n', '<leader>dl', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })

-- LSP keymaps (set when LSP attaches)
vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function(ev)
    local opts = { buffer = ev.buf }
    keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- ============================================================================
-- END OF CONFIG
-- ============================================================================

print("Work-safe init.lua loaded! No plugins required.")
