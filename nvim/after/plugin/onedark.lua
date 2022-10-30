local status, onedark = pcall(require, "onedark")
if not status then
	return
end

onedark.setup({
	style = "dark",
	transparent = true,
	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "italic",
		strings = "none",
		variables = "none",
	},
})
onedark.load()
