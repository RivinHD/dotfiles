return {
	{
		"dmtrKovalenko/fff.nvim",
		build = function()
			-- this will download prebuild binary or try to use existing rustup toolchain to build from source
			-- (if you are using lazy you can use gb for rebuilding a plugin if needed)
			require("fff.download").download_or_build_binary()
		end,
		opts = { -- (optional)
			debug = {
				enabled = true, -- we expect your collaboration at least during the beta
				show_scores = true, -- to help us optimize the scoring system, feel free to share your scores!
			},
			keymaps = {
				close = { "<Esc>", "<C-c>" },
				move_up = { "<Up>", "<C-p>", "<C-k>" },
				move_down = { "<Down>", "<C-n>", "<C-j>" },
			},
		},
		-- No need to lazy-load with lazy.nvim.
		-- This plugin initializes itself lazily.
		lazy = false,
		keys = {
			{
				"ff", -- try it if you didn't it is a banger keybinding for a picker
				function()
					fff = require("fff")
					fff.scan_files()
					fff.find_files()
				end,
				desc = "FFFind files",
			},
			{
				"gff", -- try it if you didn't it is a banger keybinding for a picker
				function()
					fff = require("fff").live_grep()
				end,
				desc = "LiFFFe grep",
			},
		},
	},
}
