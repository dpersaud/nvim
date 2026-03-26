return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter", -- Start Copilot when entering insert mode
  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,     -- Automatically show suggestions
        debounce = 75,           -- Debounce time for suggestions
        keymap = {
          accept = "<S-Tab>",    -- Accept full suggestion
          accept_word = "<C-w>", -- Accept next word
          accept_line = "<C-q>", -- Accept next suggestion (line-wise)
          next = "<C-.>",        -- Go to next suggestion
          prev = "<C-,>",        -- Go to previous suggestion
          dismiss = "<C-]>",     -- Dismiss suggestion
        },
      },
      panel = {
        enabled = false, -- Disable suggestion panel (optional)
      },

      filetypes = {
        markdown = true,
        python = true,
        help = true,
        gitcommit = true,
        ["*"] = true, -- enable for all filetypes
      },
    })

    -- 🌫 Make suggestions appear faint
    vim.api.nvim_set_hl(0, "CopilotSuggestion", {
      fg = "#555555", -- soft gray
      ctermfg = 240,
      italic = true,
    })

    vim.keymap.set("n", "<leader>gp", function()
      if require("copilot.client").is_disabled() then
        require("copilot.command").enable()
        print("Copilot enabled")
      else
        require("copilot.command").disable()
        print("Copilot disabled")
      end
    end, { desc = "Toggle [G]itHub Copilot [P]ower" })

    -- Toggle suggestions
    vim.keymap.set("n", "<leader>gs", function()
      local suggestion = require("copilot.suggestion")
      if suggestion.is_visible() then
        suggestion.dismiss()
      end
      local auto = vim.g.copilot_auto_trigger
      if auto == nil or auto == true then
        vim.g.copilot_auto_trigger = false
        require("copilot.suggestion").toggle_auto_trigger()
        print("Copilot suggestions disabled")
      else
        vim.g.copilot_auto_trigger = true
        require("copilot.suggestion").toggle_auto_trigger()
        print("Copilot suggestions enabled")
      end
    end, { desc = "Toggle [G]itHub Copilot [S]uggestions" })


    --
    -- -- 🔀 Toggle Copilot with <leader>cc
    -- vim.keymap.set("n", "<leader>ge", function()
    --   local enabled = vim.g.copilot_enabled
    --   if enabled == nil or enabled == 1 then
    --     vim.cmd("Copilot disable")
    --     print("Copilot disabled")
    --   else
    --     vim.cmd("Copilot enable")
    --     print("Copilot enabled")
    --   end
    -- end, { desc = "Toggle if GitHub [C]opilot is [E]nabled " })
    --
    --
    -- -- add keymap to toggle suggestions on and off
    -- vim.keymap.set("n", "<leader>gs", function()
    --   local auto_trigger = vim.g.copilot_auto_trigger
    --   if auto_trigger == nil or auto_trigger == true then
    --     vim.g.copilot_auto_trigger = false
    --     print("Copilot suggestions disabled")
    --   else
    --     vim.g.copilot_auto_trigger = true
    --     print("Copilot suggestions enabled")
    --   end
    -- end, { desc = "Toggle if GitHub [C]opilot [S]uggestions are showing" })
  end,
}
