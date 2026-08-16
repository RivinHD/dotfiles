local function toggle_diffview(cmd)
	if next(require("diffview.lib").views) == nil then
		vim.cmd(cmd)
	else
		vim.cmd("DiffviewClose")
	end
end

return {
	{
		"sindrets/diffview.nvim",
		command = "DiffviewOpen",
		keys = {
			{
				"<Leader>dff",
				function()
					toggle_diffview("DiffviewOpen")
				end,
			},
			{
				"<Leader>dfh",
				function()
					toggle_diffview("DiffviewFileHistory")
				end,
			},
		},
	},
}
