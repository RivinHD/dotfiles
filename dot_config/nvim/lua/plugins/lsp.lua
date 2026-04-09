return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				-- LSP
				"zls", -- zig
				"clangd", -- c/c++
				-- disable until auto import support "zuban", -- python
				"basedpyright", -- python
				"tinymist", -- typst
				"lua_ls", -- lua
				"jsonls", -- json
				"rust_analyzer", -- rust
				"neocmake", -- cmake
				"texlab", -- latex

				-- Spell-Checking
				"harper_ls",

				-- Formatter & Linter
				"ruff", -- python
				"stylua", -- lua
			},
		},
		dependencies = {
			"neovim/nvim-lspconfig",
			{
				"mason-org/mason.nvim",
				opts = {},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		version = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("*", {
				capabilities = capabilities,
			})
			vim.lsp.config("tinymist", {
				settings = {
					formatterMode = "typstyle",
					exportPdf = "onSave",
					formatterPrintWidth = 100,
					formatterIndentSize = 4,
				},
			})
			vim.lsp.config("ruff", {
				settings = {
					lineLength = 100,
				},
			})
			vim.lsp.config("harper_ls", {
				settings = {
					["harper-ls"] = {
						isolateEnglish = true,
					},
				},
			})
			vim.lsp.config("zls", {
				settings = {
					zls = {
						-- Whether to enable build-on-save diagnostics
						--
						-- Further information about build-on save:
						-- https://zigtools.org/zls/guides/build-on-save/
						enable_build_on_save = true,

						-- Neovim already provides basic syntax highlighting
						semantic_tokens = "partial",
					},
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "ruff" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>f",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- This will provide type hinting with LuaLS
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = {
					-- To fix auto-fixable lint errors.
					"ruff_fix",
					-- To run the Ruff formatter.
					"ruff_format",
					-- To organize the imports.
					"ruff_organize_imports",
				},
			},
			-- Set default options
			default_format_opts = {
				lsp_format = "fallback",
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500 },
			-- Customize formatters
			formatters = {
				-- shfmt = {
				--     append_args = { "-i", "2" },
				-- },
			},
		},
	},
}
