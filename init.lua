require("core.options")
require("core.keymaps")
require("core.autocmds")

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    error("Error cloning lazy.nvim:\n" .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
  require("plugins.icons"),
  require("plugins.colortheme"),
  require("plugins.lualine"),
  require("plugins.treesitter"),
  require("plugins.mason"), -- used for installing LSP servers
  require("plugins.lsp"),
  require("plugins.telescope"),
  require("plugins.blink"),
  require("plugins.undotree"),
  require("plugins.marks"),
  require("plugins.indent-blankline"),
  require("plugins.surround"),
  require("plugins.slime"),
  require("plugins.vimtex"),
  require("plugins.copilot"), -- maybe replace this with something like "ollama-copilot" so it can run locally and not require an internet connection
  require("plugins.gen"),
  require("plugins.misc"),


  -- require("plugins.bufferline"),     -- no longer using this
  -- require("plugins.neotree"),				-- just using :e for noe
  -- -- replace with yazi at some point (https://github.com/mikavilpas/yazi.nvim?tab=readme-ov-file, https://github.com/sxyazi/yazi)
  -- require("plugins.autocompletion"), -- replaced by blin
  -- require("plugins.none-ls"),        -- i have no idea what this does
  -- require("plugins.gitsigns"),
  -- require("plugins.alpha"),
  -- require("plugins.trouble"), ---
  -- require("plugins.markview"),
  -- require("plugins.snacks"),
  --
  -- require("plugins.iron"),
  -- require("plugins.nvim-tmux-navigator"),
})
