local has = vim.fn.has
local is_win = has("win32")

if is_win == 1 then
	require("systems.win")
end
