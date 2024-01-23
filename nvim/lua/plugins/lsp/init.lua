local U = require("util")

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"folke/neoconf.nvim",
			cmd = "Neoconf",
			opts = {
				library = {
					plugins = { "neotest" },
					types = true,
				},
			},
			config = function(_, opts)
				require("neoconf").setup(opts)
			end,
			dependencies = { "nvim-lspconfig" },
		},
		{
			"folke/neodev.nvim",
			opts = {},
		},
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = {
				spacing = 4,
				source = "lf_many",
				prefix = "●",
			},
			severity_sort = true,
		},
		inlay_hints = {
			enabled = false,
		},
		capabilities = {},
		format = {
			formatting_options = nil,
			timeout_ms = nil,
		},
		servers = {
			lua_ls = {
				single_file_support = true,
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
						completion = {
							workspaceWord = true,
							callSnippet = "Both",
						},
						hint = {
							enable = true,
							setType = false,
							paramType = true,
							paramName = "Disable",
							semicolon = "Disable",
							arrayIndex = "Disable",
						},
						doc = {
							privateName = { "^_" },
						},
						type = {
							castNumberToInteger = true,
						},
						diagnostics = {
							disable = { "incomplete-signature-doc", "trailing-space" },
							-- enable = false,
							groupSeverity = {
								strong = "Warning",
								strict = "Warning",
							},
							groupFileStatus = {
								["ambiguity"] = "Opened",
								["await"] = "Opened",
								["codestyle"] = "None",
								["duplicate"] = "Opened",
								["global"] = "Opened",
								["luadoc"] = "Opened",
								["redefined"] = "Opened",
								["strict"] = "Opened",
								["strong"] = "Opened",
								["type-check"] = "Opened",
								["unbalanced"] = "Opened",
								["unused"] = "Opened",
							},
							unusedLocalExclude = { "_*" },
						},
						format = {
							enable = false,
							defaultConfig = {
								indent_style = "space",
								indent_size = "2",
								continuation_indent_size = "2",
							},
						},
					},
				},
			},
			yamlls = {
				settings = {
					yaml = {
						keyOrdering = false,
					},
				},
			},
			vimls = {},
			tsserver = {
				root_dir = function(...)
					return require("lspconfig.util").root_pattern(".git")(...)
				end,
				single_file_support = false,
				settings = {
					typescript = {
						inlayHints = {
							includeInlayParameterNameHints = "literal",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = false,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
					javascript = {
						inlayHints = {
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayEnumMemberValueHints = true,
						},
					},
				},
			},
			twig_language_server = {},
			svelte = {},
			tailwindcss = {
				root_dir = function(...)
					return require("lspconfig.util").root_pattern(".git")(...)
				end,
			},
			jsonls = {
				on_new_config = function(new_config)
					new_config.settings.json.schemas = new_config.settings.json.schemas or {}
					vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
				end,
				settings = {
					json = {
						format = {
							enable = true,
						},
						validate = {
							enable = true,
						},
					},
				},
			},
			pyright = {},
			dockerls = {},
			docker_compose_language_service = {},
			astro = {},
			bashls = {},
			cssls = {},
			html = {},
			intelephense = {},
		},
		setup = {},
	},
	config = function(_, opts)
		if require("lazy.core.config").spec.plugins["noeconf.nvim"] ~= nil then
			local plugin = require("lazy.core.config").spec.plugins["neoconf.nvim"]
			require("neoconf").setup(require("lazy.core.plugin").values(plugin, "opts", false))
		end

		U.on_attach(function(client, buffer)
			require("plugins.lsp.keymaps").on_attach(client, buffer)
		end)

		local register_capability = vim.lsp.handlers["client/registerCapability"]

		vim.lsp.handlers["client/registerCapability"] = function(err, res, ctx)
			local ret = register_capability(err, res, ctx)
			local client_id = ctx.client_id
			local client = vim.lsp.get_client_by_id(client_id)
			local buffer = vim.api.nvim_get_current_buf()
			require("lsp.keymaps").on_attach(client, buffer)
			return ret
		end

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		if opts.inlay_hints.enabled then
			U.on_attach(function(client, buffer)
				if client.supports_method("textDocument/inlayHint") then
					local ih = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
					if type(ih) == "function" then
						ih(buffer, true)
					elseif type(ih) == "table" and ih.enable then
						if value == nil then
							value = not ih.is_enabled(buffer)
						end
						ih.enable(buffer, true)
					end
				end
			end)
		end

		if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
			opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and "●"
				or function(diagnostic)
					local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
					for d, icon in pairs(signs) do
						if diagnostic.severity == vim.diagnostic.serverity[d:upper()] then
							return icon
						end
					end
				end
		end

		vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

		local servers = opts.servers
		local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			has_cmp and cmp_nvim_lsp.default_capabilities() or {},
			opts.capabilities or {}
		)

		local function setup(server)
			local server_opts = vim.tbl_deep_extend("force", {
				capabilities = vim.deepcopy(capabilities),
			}, servers[server] or {})

			if opts.setup[server] then
				if opts.setup[server](server, server_opts) then
					return
				end
			elseif opts.setup["*"] then
				if opts.setup["*"](server, server_opts) then
					return
				end
			end
			require("lspconfig")[server].setup(server_opts)
		end

		local have_mason, mlsp = pcall(require, "mason-lspconfig")
		local all_mslp_servers = {}
		if have_mason then
			all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
		end
		local ensure_installed = {}
		for server, server_opts in pairs(servers) do
			if server_opts then
				server_opts = server_opts == true and {} or server_opts
				if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
					setup(server)
				else
					ensure_installed[#ensure_installed + 1] = server
				end
			end
		end

		if have_mason then
			mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
		end

		if U.get_config("denols") and U.get_config("tsserver") then
			local is_deno = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc")
			U.disable("tsserver", is_deno)
			U.disable("denols", function(root_dir)
				return not is_deno(root_dir)
			end)
		end
	end,
}