local M = {}

function M.has(plugin)
	return require("lazy.core.config").spec.plugins[plugin] ~= nil
end

function M.on_attach(func)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf ---@type number
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			func(client, buffer)
		end,
	})
end

function M.get_config(server)
	local configs = require("lspconfig.configs")
	return rawget(configs, server)
end

function M.disable(server, cond)
	local util = require("lspconfig.util")
	local def = M.get_config(server)
	---@diagnostic disable-next-line: undefined-field
	def.document_config.on_new_config = util.add_hook_before(
		def.document_config.on_new_config,
		function(config, root_dir)
			if cond(root_dir, config) then
				config.enabled = false
			end
		end
	)
end

function M.get_clients(opts)
	local ret = {}
	if vim.lsp.get_clients then
		ret = vim.lsp.get_clients(opts)
	else
		ret = vim.lsp.get_active_clients(opts)
		if opts and opts.method then
			ret = vim.tbl_filter(function(client)
				return client.supports_method(opts.method, { bufnr = opts.bufnr })
			end, ret)
		end
	end
	return opts and opts.filter and vim.tbl_filter(opts.filter, ret) or ret
end

function M.opts(name)
	local plugin = require("lazy.core.config").plugins[name]
	if not plugin then
		return {}
	end
	local Plugin = require("lazy.core.plugin")
	return Plugin.values(plugin, "opts", false)
end

return M