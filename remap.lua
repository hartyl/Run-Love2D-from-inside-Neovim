-- Add this code to your Neovim configuration file, tweak it as you see fit
-- WSL version is also included, but it is commented

-- Optional Welcome Message (I really like it)
vim.cmd(
	[[if execute("!ls main.lua") =~ "main\.lua\n$"
		echom "Welcome to Love2D!"
	elseif expand("%") =~ "\.lua$"
		echom "Welcome to Lua!"
	endif]])

-- Change the shortcut to whatever
vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd(
	[[
	" if it finds a main.lua in the project folder
	if execute("!ls main.lua") =~ "main\.lua\n$"
		" run love in the project file
		silent !love .
		" If you are using WSL, add the line "export PATH=$PATH:/mnt/c/"Program Files"/LOVE" or similar to /~/.bashrc
		" silent !love.exe .
	" if you are currently editing a lua file, shout out it
	elseif expand("%") =~ "\.lua$"
		so
	endif]])
end)
