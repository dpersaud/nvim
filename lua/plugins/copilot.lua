return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	event = "InsertEnter", -- Start Copilot when entering insert mode
	config = function()
		require("copilot").setup({
			suggestion = {
				auto_trigger = true, -- Automatically show suggestions
				debounce = 75, -- Debounce time for suggestions
				keymap = {
					accept = "<S-Tab>", -- Accept full suggestion
					accept_word = "<S-w>", -- Accept next word
					accept_line = "<S-q>", -- Accept next suggestion (line-wise)
					next = "<C-.>", -- Go to next suggestion
					prev = "<C-,>", -- Go to previous suggestion
					dismiss = "<C-]>", -- Dismiss suggestion
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

		-- 🔀 Toggle Copilot with <leader>cc
		vim.keymap.set("n", "<leader>cc", function()
			local enabled = vim.g.copilot_enabled
			if enabled == nil or enabled == 1 then
				vim.cmd("Copilot disable")
				print("Copilot disabled")
			else
				vim.cmd("Copilot enable")
				print("Copilot enabled")
			end
		end, { desc = "Toggle GitHub Copilot" })
	end,
}
