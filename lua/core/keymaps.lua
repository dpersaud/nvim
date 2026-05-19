-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Clipboard
vim.keymap.set("n", "x", '"_x', opts)          -- delete character without putting it in clipboard
vim.keymap.set({ "n", "v" }, "d", '"_d', opts) -- Delete without yanking
vim.keymap.set({ "n", "v" }, "D", "d", opts)   -- Make D behave like d ie. delete and yank
vim.keymap.set("v", "p", '"_dP', opts)         -- paste without replacig clipboard
vim.keymap.set("n", "DD", 'dd', opts)          -- Make DD behave like dd ie. delete line and yank
vim.keymap.set("n", "dd", '"_dd', opts)        -- delete line without putting it in clipboard


vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Seraching
vim.keymap.set("n", "<leader>?", ":nohl<CR>") -- clear search highlighting


-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")   -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- close new tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")     -- next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")     -- previous tab

-- File Explorer
vim.keymap.set("n", "<leader>e", ":e .<CR>")

-- Chat
vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen Chat<CR>')

--
-- -- Resize with arrows
-- vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
-- vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
-- vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
-- vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
-- vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
-- vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
-- vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", opts) -- close buffer
-- vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer
--
-- -- save and close current buffer without closing window
-- vim.cmd([[
--   command! WQ w | Bdelete!
-- ]])
-- -- just close current buffer without saving
-- vim.cmd([[
--   command! Q Bdelete!
-- ]])
--
-- -- Increment/decrement numbers
-- vim.keymap.set("n", "<leader>+", "<C-a>", opts) -- increment
-- vim.keymap.set("n", "<leader>-", "<C-x>", opts) -- decrement
--
-- -- Window management
-- vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
-- vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
-- vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
-- vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window
--
-- Navigate between splits
-- vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
-- vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
-- vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
-- vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)
--
-- -- Tabs
-- vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
-- vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
-- vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
-- vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Press jk fast to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)

-- do the same in terminal mode
vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
vim.keymap.set("t", "kj", [[<C-\><C-n>]], opts)

-- do the same in visual mode
vim.keymap.set("v", "jk", "<ESC>", opts)
vim.keymap.set("v", "kj", "<ESC>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv", opts)
--
-- -- Keep last yanked when pasting
-- vim.keymap.set("v", "p", '"_dP', opts)
--
-- replace all in file
-- vim.keymap.set("n", "<leader>f", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- <leader>r : Replace word under cursor without confirmation
-- vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/]], opts)

-- <leader>R : Replace word under cursor with confirmation
-- vim.keymap.set("n", "<leader>R", [[:%s/\<<C-r><C-w>\>//gc<Left><Left><Left>]], opts)

-- Navigate the line
vim.keymap.set({ "n", "v" }, "<leader>h", "^", opts)
vim.keymap.set({ "n", "v" }, "<leader>l", "g_", opts)

-- iPython
vim.keymap.set("n", "<leader>op", ":vsplit term://ipython --profile=slime<CR>", opts)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts) -- get back to normal mode in the terminal
vim.g.slime_python_ipython = 1
vim.g.slime_default_config = {
  socket_name = "default",
  target_pane = "{right-of}",
}

-- toggle wrapping
vim.keymap.set("n", "<leader>tw", function()
  vim.wo.wrap = not vim.wo.wrap
  vim.wo.linebreak = vim.wo.wrap
  vim.wo.showbreak = vim.wo.wrap and "↪ " or ""

  if vim.wo.wrap then
    -- Movement keys respect visual lines
    vim.keymap.set({ "n", "v" }, "j", "gj", { buffer = 0, silent = true })
    vim.keymap.set({ "n", "v" }, "k", "gk", { buffer = 0, silent = true })
    vim.keymap.set({ "n", "v" }, "<leader>h", "g0", { buffer = 0, silent = true })
    -- vim.keymap.set({ "n", "v" }, "<leader>l", "g$", { buffer = 0, silent = true })
    vim.keymap.set("n", "<leader>l", "g$", { buffer = 0, silent = true })
    vim.keymap.set("v", "<leader>l", "g_", { buffer = 0, silent = true })
  else
    -- Restore defaults when wrap is off
    vim.keymap.del({ "n", "v" }, "j", { buffer = 0 })
    vim.keymap.del({ "n", "v" }, "k", { buffer = 0 })
    vim.keymap.del({ "n", "v" }, "^", { buffer = 0 })
    vim.keymap.del({ "n", "v" }, "g_", { buffer = 0 })
  end

  vim.notify("wrap = " .. tostring(vim.wo.wrap), vim.log.levels.INFO)
end, { desc = "Toggle wrap", noremap = true, silent = true })
