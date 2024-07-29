local function DFS(G, start_v)
	local color = {}
	local sequence = {}

	local function DFS_recursive(v)
		-- mark v as gray (currently being visited)
		color[v] = "gray"
		
		-- record the visit
		table.insert(sequence, v)

		-- perform DFS on neighbors
		for _, w in ipairs(G[v]) do
			if color[w] == nil then  -- treat nil as 'white' - not visited
				DFS_recursive(w)
			end
		end

		color[v] = "black" -- fully processed
	end

	-- perform DFS from start_v 
	print("Starting at " .. start_v)
	DFS_recursive(start_v)

	-- perform DFS for disconnected components
	for v, _ in pairs(G) do
		if color[v] == nil then
			print("Disconnected component found - starting at " .. v)
			DFS_recursive(v)
		end
	end

	return sequence
end
