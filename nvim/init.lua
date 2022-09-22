require('settings')
require('plugins')
require('maps')

local has = function(x) return vim.fn.has(x) == 1 end

local is_mac = has 'macunix'
local is_win = has 'win32'
local is_linux = has 'linux'

if is_mac then require('mac') end
if is_win then require('win') end
if is_linux then require('linux') end
