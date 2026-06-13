-- ============================================================================
-- NO-PLUGIN NEOVIM CONFIG (Neovim 0.11+) — self-contained, zero downloads
-- ============================================================================
-- Portable: copy this single file to ~/.config/nvim/init.lua on any machine,
-- or load it in isolation with `NVIM_APPNAME=nvim-min nvim`.
--
-- Native LSP is wired CONDITIONALLY — a server only starts if its binary is on
-- PATH (vim.fn.executable). The same file therefore works unchanged on a
-- locked-down box that has no language servers installed.
--
-- Modern built-ins you already have (NO plugin needed):
--   gc / gcc ............ comment / uncomment (operator + line)
--   grn ................. LSP rename            gra ... code action
--   grr ................. LSP references        gri ... implementation
--   grt ................. type definition       gO .... document symbols
--   K ................... hover docs            [d ]d . prev/next diagnostic
--   ]q [q / ]b [b ....... quickfix / buffer navigation (unimpaired-style)
--   % .................. matchit (jump matching keyword/tag)
--   gx ................. open URL/file under cursor
--   :Inspect ........... show highlight/treesitter under cursor
--   <C-x><C-o/f/l/n> ... insert-mode completion (omni / file / line / keyword)
-- ============================================================================

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
opt.hlsearch = true -- highlight matches (clear with <leader>nh)
opt.incsearch = true

-- Visual settings
opt.termguicolors = true
opt.background = "dark" -- matches the habamax theme below
opt.signcolumn = "yes"
opt.colorcolumn = "100"
opt.showmatch = true
opt.matchtime = 2
opt.cmdheight = 1
opt.completeopt = "menu,menuone,noselect,popup,fuzzy" -- 0.11: fuzzy match + info popup
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.conceallevel = 0
opt.concealcursor = ""
opt.synmaxcol = 300
opt.fillchars = { eob = " " }

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "screen" -- keep text position stable when opening/closing splits

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
opt.path:append("**") -- :find searches recursively from cwd
opt.mouse = "a"
opt.encoding = "UTF-8"
opt.confirm = true -- prompt to save instead of failing on :q with changes
opt.title = true -- set terminal title to the file name
opt.virtualedit = "block" -- let Visual-block select past end-of-line
opt.smoothscroll = true -- screen-line scrolling with wrapped lines
opt.inccommand = "split" -- live preview of :substitute
opt.jumpoptions = "stack" -- more intuitive jumplist behavior

-- Whitespace / list characters (UTF-8, no Nerd Font required)
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", extends = "›", precedes = "‹" }

-- Spelling (off by default; toggle with <leader>us)
opt.spelllang = "en_us"

-- Cursor settings
opt.guicursor =
  "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Folding (built-in treesitter foldexpr — safe even when a buffer has no parser)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldnestmax = 4

-- Command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })
opt.wildignore:append({ "*/node_modules/*", "*/.git/*", "*/dist/*", "*/build/*" })
opt.wildoptions = { "pum", "tagfile", "fuzzy" } -- fuzzy :find / :buffer in a popup

-- Better diff options
opt.diffopt:append("linematch:60")

-- Performance improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- Netrw settings (built-in file explorer via :Explore)
vim.g.netrw_liststyle = 3 -- tree view
vim.g.netrw_banner = 0 -- hide the help banner

-- ============================================================================
-- THEME & TRANSPARENCY (optional, comment out if not needed)
-- ============================================================================

vim.cmd.colorscheme("habamax") -- built-in (also try: retrobox, slate, sorbet, wildcharm)

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
keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

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

-- Tab navigation
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
  local current_file = vim.fn.expand("%:p")
  if current_file ~= "" then
    vim.cmd("tabnew " .. current_file)
  else
    vim.cmd("tabnew")
  end
end

-- Function to close tabs to the right
local function close_tabs_right()
  local current_tab = vim.fn.tabpagenr()
  local last_tab = vim.fn.tabpagenr("$")
  for i = last_tab, current_tab + 1, -1 do
    vim.cmd(i .. "tabclose")
  end
end

-- Function to close tabs to the left
local function close_tabs_left()
  local current_tab = vim.fn.tabpagenr()
  for _ = current_tab - 1, 1, -1 do
    vim.cmd("1tabclose")
  end
end

keymap.set("n", "<leader>td", duplicate_tab, { desc = "Duplicate current tab" })
keymap.set("n", "<leader>tr", close_tabs_right, { desc = "Close tabs to the right" })
keymap.set("n", "<leader>tL", close_tabs_left, { desc = "Close tabs to the left" })

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
keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })

-- Smart close buffer/tab
local function smart_close_buffer()
  local buffers_in_tab = #vim.fn.tabpagebuflist()
  if buffers_in_tab > 1 then
    vim.cmd("bdelete")
  else
    vim.cmd("tabclose")
  end
end
keymap.set("n", "<leader>bd", smart_close_buffer, { desc = "Smart close buffer/tab" })

-- ============================================================================
-- FILE NAVIGATION
-- ============================================================================

-- Quick file navigation
keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { desc = "Open file explorer" })
keymap.set("n", "<leader>ff", ":find ", { desc = "Find file (:find)" })

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

keymap.set("n", "<leader>pf", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Full path: " .. path)
end, { desc = "Copy full file path" })

keymap.set("n", "<leader>pr", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  print("Relative path: " .. path)
end, { desc = "Copy relative file path" })

-- Rename current file
keymap.set("n", "<leader>rr", function()
  local old_name = vim.fn.expand("%")
  local new_name = vim.fn.input("New file name: ", old_name)
  if new_name ~= "" and new_name ~= old_name then
    vim.cmd("saveas " .. new_name)
    vim.fn.delete(old_name)
    print("File renamed to: " .. new_name)
  end
end, { desc = "Rename current file" })

-- ============================================================================
-- AUTOCOMMANDS
-- ============================================================================

local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.hl.on_yank({ higroup = "IncSearch", timeout = 200 })
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
    if line > 0 and line <= lcount and vim.fn.index({ "commit", "gitrebase", "xxd" }, ft) == -1 and not vim.o.diff then
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
      pcall(vim.api.nvim_buf_delete, 0, {})
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
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- ============================================================================
-- FLOATING TERMINAL
-- ============================================================================

local terminal_state = {
  buf = nil,
  win = nil,
  is_open = false,
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
    vim.bo[terminal_state.buf].bufhidden = "hide"
  end

  -- Calculate window dimensions
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create the floating window
  terminal_state.win = vim.api.nvim_open_win(terminal_state.buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
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
    vim.fn.jobstart(os.getenv("SHELL") or "bash", { term = true })
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
    once = true,
  })
end

-- Terminal keymaps. <C-\> is normal-mode only so it does NOT shadow the
-- standard terminal-mode escape <C-\><C-n>. Close the float from inside with <Esc>.
keymap.set("n", "<C-\\>", FloatingTerminal, { noremap = true, silent = true, desc = "Toggle floating terminal" })
keymap.set("n", "<leader>tt", FloatingTerminal, { noremap = true, silent = true, desc = "Toggle floating terminal" })
keymap.set("t", "<Esc>", function()
  if terminal_state.is_open then
    vim.api.nvim_win_close(terminal_state.win, false)
    terminal_state.is_open = false
  end
end, { noremap = true, silent = true, desc = "Close floating terminal from terminal mode" })

-- ============================================================================
-- COMPLETION (insert-mode popup ergonomics)
-- ============================================================================

local function feed(keys)
  return vim.api.nvim_replace_termcodes(keys, true, false, true)
end

-- Tab / Shift-Tab navigate the popup ONLY when it is visible; otherwise the
-- keys behave normally (indent / nothing).
keymap.set("i", "<Tab>", function()
  return vim.fn.pumvisible() == 1 and feed("<C-n>") or feed("<Tab>")
end, { expr = true, silent = true })
keymap.set("i", "<S-Tab>", function()
  return vim.fn.pumvisible() == 1 and feed("<C-p>") or feed("<S-Tab>")
end, { expr = true, silent = true })

-- <CR> confirms a SELECTED item (applying LSP side effects); with nothing
-- selected it dismisses the menu and inserts a real newline.
keymap.set("i", "<CR>", function()
  if vim.fn.pumvisible() == 1 then
    return vim.fn.complete_info({ "selected" }).selected ~= -1 and feed("<C-y>") or feed("<C-e><CR>")
  end
  return feed("<CR>")
end, { expr = true, silent = true })

-- Manually trigger completion: LSP if available, else built-in keyword completion.
keymap.set("i", "<C-Space>", function()
  if #vim.lsp.get_clients({ bufnr = 0, method = "textDocument/completion" }) > 0 then
    vim.lsp.completion.get()
  else
    vim.api.nvim_feedkeys(feed("<C-x><C-n>"), "n", false)
  end
end, { silent = true, desc = "Trigger completion" })

-- ============================================================================
-- NATIVE LSP (Neovim 0.11) — conditional, zero-plugin
-- ============================================================================

-- Shared defaults merged into every server (lowest priority).
vim.lsp.config("*", {
  capabilities = {
    textDocument = {
      foldingRange = { dynamicRegistration = false, lineFoldingOnly = true },
    },
  },
  root_markers = { ".git" },
})

-- name -> spec. cmd[1] is the executable we gate on with vim.fn.executable().
local servers = {
  gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { "go.work", "go.mod", ".git" },
    settings = {
      gopls = {
        analyses = { unusedparams = true },
        staticcheck = true,
        gofumpt = true,
      },
    },
  },
  basedpyright = {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
  },
  pyright = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
  },
  ruff = {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
  },
  ts_ls = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  },
  clangd = {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=iwyu" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
    root_markers = { ".clangd", "compile_commands.json", "compile_flags.txt", ".git" },
  },
  lua_ls = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
        telemetry = { enable = false },
      },
    },
  },
}

-- Register + enable ONLY servers whose binary is installed; skip the rest silently.
for name, spec in pairs(servers) do
  if vim.fn.executable(spec.cmd[1]) == 1 then
    vim.lsp.config(name, spec)
    vim.lsp.enable(name)
  end
end

-- Per-buffer behavior when a server attaches.
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user.lsp", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end
    local buf = args.buf
    local function map(mode, lhs, rhs, desc)
      keymap.set(mode, lhs, rhs, { buffer = buf, silent = true, desc = desc })
    end

    -- Built-in LSP autocompletion (insert mode, triggered as you type).
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, buf, { autotrigger = true })
    end

    -- 0.11 already provides: grn rename, gra code action, grr refs, gri impl,
    -- grt type def, gO symbols, K hover, [d/]d/<C-W>d diagnostics. We only add
    -- conflict-free extras under the freed <leader>c "code" namespace.
    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>cr", vim.lsp.buf.rename, "Rename")
    map("n", "<leader>cd", function()
      vim.diagnostic.open_float({ scope = "line" })
    end, "Line diagnostics (float)")
    map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help") -- insert <C-s> is used for save

    if client:supports_method("textDocument/formatting") then
      map({ "n", "x" }, "<leader>cf", function()
        vim.lsp.buf.format({ async = true })
      end, "Format")
    end

    if client:supports_method("textDocument/inlayHint") then
      map("n", "<leader>ui", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
      end, "Toggle inlay hints")
    end
  end,
})

-- OPTIONAL format-on-save (uncomment to enable):
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = vim.api.nvim_create_augroup("user.lsp.format", { clear = true }),
--   callback = function(args)
--     if #vim.lsp.get_clients({ bufnr = args.buf, method = "textDocument/formatting" }) > 0 then
--       vim.lsp.buf.format({ bufnr = args.buf, async = false, timeout_ms = 1000 })
--     end
--   end,
-- })

-- ============================================================================
-- DIAGNOSTICS & UI TOGGLES
-- ============================================================================

vim.diagnostic.config({
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.INFO] = "I",
      [vim.diagnostic.severity.HINT] = "H",
    },
  },
  virtual_text = { spacing = 2, prefix = "-", source = "if_many" },
  virtual_lines = false,
  float = { border = "rounded", source = "if_many" },
  jump = { float = true }, -- ]d / [d show the float when jumping
})

-- Toggle inline virtual_text <-> full-width virtual_lines.
keymap.set("n", "<leader>ul", function()
  local on = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = on, virtual_text = not on })
end, { desc = "Toggle diagnostic virtual_lines" })

-- Toggle diagnostics on/off.
keymap.set("n", "<leader>ud", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "Toggle diagnostics" })

-- Send diagnostics to the quickfix list.
keymap.set("n", "<leader>cq", vim.diagnostic.setqflist, { desc = "Diagnostics to quickfix" })

-- Toggle spell checking.
keymap.set("n", "<leader>us", function()
  vim.wo.spell = not vim.wo.spell
end, { desc = "Toggle spell" })

-- ============================================================================
-- TREESITTER HIGHLIGHTING (bundled parsers only)
-- ============================================================================
-- Only these parsers ship with Neovim; every other filetype falls back to the
-- universal built-in :syntax highlighting.
local TS_OK = {
  c = true,
  lua = true,
  markdown = true,
  markdown_inline = true,
  query = true,
  vim = true,
  vimdoc = true,
}
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("user.treesitter", { clear = true }),
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft) or ft
    if TS_OK[lang] and vim.treesitter.language.add(lang) then
      pcall(vim.treesitter.start, args.buf, lang)
    end
  end,
})

-- ============================================================================
-- FIND / GREP / QUICKFIX (built-in, no plugins)
-- ============================================================================

-- Use ripgrep for :grep when available (smart-case, include hidden, skip .git).
if vim.fn.executable("rg") == 1 then
  vim.o.grepprg = "rg --vimgrep --smart-case --hidden --glob=!.git"
  vim.o.grepformat = "%f:%l:%c:%m"
end

-- :Grep <pattern>  -> populate quickfix without jumping, then open it.
vim.api.nvim_create_user_command("Grep", function(o)
  vim.cmd("silent grep! " .. o.args)
  if not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd("copen")
  else
    vim.notify("No matches: " .. o.args, vim.log.levels.INFO)
  end
end, { nargs = "+", complete = "file" })

-- Grep by prompt / word under cursor.
keymap.set("n", "<leader>fs", function()
  local q = vim.fn.input("Grep: ")
  if q ~= "" then
    vim.cmd("Grep " .. vim.fn.fnameescape(q))
  end
end, { desc = "Grep (prompt)" })
keymap.set("n", "<leader>fg", function()
  vim.cmd("Grep " .. vim.fn.expand("<cword>"))
end, { desc = "Grep word under cursor" })

-- Fuzzy buffer switch (wildoptions includes 'fuzzy'). (<leader>ff = :find already.)
keymap.set("n", "<leader>fb", ":buffer ", { desc = "Switch buffer (fuzzy)" })

-- Quickfix list. ( ]q / [q are built-in 0.11 defaults — not redefined here. )
keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open quickfix" })
keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close quickfix" })

-- ============================================================================
-- STATUSLINE (built-in, Nerd-Font-free)
-- ============================================================================

-- Git branch, cached per-buffer and refreshed lazily.
local function git_branch()
  if vim.b.user_git_branch ~= nil then
    return vim.b.user_git_branch
  end
  local file = vim.api.nvim_buf_get_name(0)
  local dir = file ~= "" and vim.fs.dirname(file) or vim.fn.getcwd()
  local out = vim.fn.systemlist({ "git", "-C", dir, "branch", "--show-current" })
  local branch = (vim.v.shell_error == 0 and out[1]) and out[1] or ""
  vim.b.user_git_branch = branch
  return branch
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "FocusGained" }, {
  group = vim.api.nvim_create_augroup("user.statusline", { clear = true }),
  callback = function()
    vim.b.user_git_branch = nil
  end,
})

local MODES = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "V-LINE",
  ["\22"] = "V-BLOCK", -- <C-v>
  c = "COMMAND",
  R = "REPLACE",
  t = "TERMINAL",
  s = "SELECT",
}

function _G.MyStatusline()
  local m = vim.api.nvim_get_mode().mode
  local branch = git_branch()
  local d = vim.diagnostic.count(0)
  local e = d[vim.diagnostic.severity.ERROR] or 0
  local w = d[vim.diagnostic.severity.WARN] or 0
  local diag = (e > 0 and " E:" .. e or "") .. (w > 0 and " W:" .. w or "")
  return table.concat({
    " ",
    MODES[m] or m,
    " ",
    branch ~= "" and ("| " .. branch .. " ") or "",
    "%<%f %h%m%r", -- file (truncate from left), help/modified/RO flags
    diag,
    "%=", -- right align
    "%y %{&fileencoding} %l:%c %P ", -- filetype, encoding, line:col, percent
  })
end

vim.o.statusline = "%!v:lua.MyStatusline()"
vim.o.laststatus = 2

-- ============================================================================
-- END OF CONFIG
-- ============================================================================
