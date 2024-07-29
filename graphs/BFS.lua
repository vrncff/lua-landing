function BFS(G, start_v)
	local Q = {}  -- queue
	local dist = {}  -- distances
	local color = {}  -- color labels: white, gray, black - unvisited, visiting, visited
	local result = {}  -- sequence of processed vertices

	-- initialization
	for v, _ in pairs(G) do
		color[v] = "white"
		dist[v] = math.huge
	end

	local function bfs_visit(start_v)
		color[start_v] = "gray"
		dist[start_v] = 0
		table.insert(Q, start_v)

		while #Q > 0 do
			local v = table.remove(Q, 1)
			print(v, dist[v])
			for _, edge in ipairs(G[v]) do -- process neighbors
				local w = edge[1]
				if color[w] == "white" then -- insert in queue if unvisited
					color[w] = "gray"
					dist[w] = dist[v] + 1 -- set its distance
					table.insert(Q, w)
				end
			end
			color[v] = "black"
			table.insert(result, v)
		end
	end

	-- perform BFS starting at start_v
	print("Distances starting at " .. start_v)
	bfs_visit(start_v)

	-- perform BFS for disconnected components
	for v, _ in pairs(G) do
		if color[v] == "white" then
			print("Distances starting at " .. v)
			bfs_visit(v)
		end
	end

	return result
end
