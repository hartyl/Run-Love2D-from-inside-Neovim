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
	silent if execute("!ls main.lua") =~ "main\.lua\n$"
		" run love in the project file
		silent !love .
		" If you are using WSL, add the line "export PATH=$PATH:/mnt/c/"Program Files"/LOVE" or similar to /~/.bashrc
		" silent !love.exe .
	" if you are currently editing a lua file, shout out it
	elseif expand("%") =~ "\.lua$"
		echom "Executing..."
		so
	" nice C++ addition! Takes the input from a text file called input.txt in the project folder's root,
	" and outputs directly to Windows's clipboard
	" This version implements g++ with c++20
	elseif expand("%") =~ "\.cpp$"
		echom "Executing..."
		silent w
		silent let output = execute("!g++ -std=c++20 % && xclip -i input.txt && xclip -o | ./a.out | xclip -selection c && rm a.out")
		if output =~ "ERROR"
			echo output
		else
			!xclip -selection c -o
		endif
	" Now why not python
	elseif expand("%") =~ "\.py$"
		echom "Executing..."
		silent w
		silent let output = execute("!xclip -i input.txt && xclip -o | python3 % | xclip -selection c")
		if output =~ "Error"
			echo output
		else
			!xclip -selection c -o
		endif
	endif]])
end)
