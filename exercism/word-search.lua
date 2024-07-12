local function find(puzzle, word) -- returns coordinates
	local dirs = {
		{0, 1},
		{1, 0},
		{1, 1},
		{1, -1},
		{0, -1},
		{-1, 0},
		{-1, -1},
		{-1, 1}
	}


	local function search(word, x, y, dx, dy) -- searchs for word in position given a direction
		local str = puzzle[x]:sub(y,y) -- char at (x,y)

		for i = 1, #word - 1 do
			new_x, new_y = x + i * dx, y + i * dy

			if new_x < 1 or new_y < 1 or new_x > #puzzle[1] or new_y > #puzzle[1] then -- short circuits if out of bounds
				return false
			end
	
			local new_chr = puzzle[new_x]:sub(new_y, new_y)
	
			if new_chr ~= word:sub(i + 1, i + 1) then  -- short circuits if a single character differs
				return false 
			end

			str = str .. new_chr
		end
	
		return (word == str)
	end

	for i = 1, #puzzle do -- for each line
		for j = 1, #puzzle[1] do -- for each column
			for _, dir in ipairs(dirs) do
				dx, dy = dir[1], dir[2]

				if search(word, i, j, dx, dy) then -- search in all directions
					local end_x, end_y = j + (#word - 1) * dy, i + (#word - 1) * dx
					return {j, i}, {end_x, end_y}
				end
			end
		end
	end

	return nil, nil
	
end

return function(puzzle)
	return {
		find = function(word)
			return find(puzzle, word)
		end
	}
end
