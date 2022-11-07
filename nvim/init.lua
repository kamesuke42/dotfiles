--
-- kamesuke42's dotfiles
--
-- author: kamesuke42 <kamesuke42@kamesuke42.com>
-- repository: https://github.com/kamesuke42/dotfiles
--

require("plugins")
require("base")
require("maps")

local function docker_ports()
	local handle = io.popen('docker ps --format "table {{.Names}}\t{{.Ports}}" 2> /dev/null')
	if handle == nil then
		return nil
	end
	local result = handle:read("*a")
	handle:close()
	return result
end

vim.api.nvim_create_user_command("DockerPorts", function()
	local result = docker_ports()
	if result == nil or result == "" then
		print("No container running")
	else
		print(result)
	end
end, {})

vim.keymap.set("n", "<leader>dp", "<cmd>DockerPorts<cr>", { noremap = true, silent = true })
