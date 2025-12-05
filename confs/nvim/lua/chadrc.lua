-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "carbonfox",
  -- transparency = true,

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false
  }
}

vim.o.guifont = "JetBrainsMono Nerd Font:h13:b,i"

-- vim.g.neovide_opacity = 0.7
vim.g.neovide_padding_top = 30
vim.g.neovide_padding_bottom = 30
vim.g.neovide_padding_right = 30
vim.g.neovide_padding_left = 30

vim.g.neovide_cursor_trail_size = 0.3

return M
