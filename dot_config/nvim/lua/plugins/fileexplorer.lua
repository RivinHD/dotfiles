return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Oil",
	event = { "VimEnter */*,.*", "BufNew */*,.*" },
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent dir" },
	},
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
}
