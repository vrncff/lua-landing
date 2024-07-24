local function heapify(arr, n, i)
	-- root, left and right children idx
	local root = i
	local left = 2 * i + 1
	local right = 2 * i + 2

	-- root should be the largest value
	if left < n and arr[left] > arr[root] then
		root = left
	end

	if right < n and arr[right] > arr[root] then
		root = right
	end

	if root ~= i then -- if largest isnt root
		arr[i], arr[root] = arr[root], arr[i]
		heapify(arr, n, root) -- recursive call
	end
end

local function build_heap(arr, n)
	local start = math.floor(n / 2) - 1 -- last non leaf node

	for i = start, 1, -1 do
		heapify(arr, n, i)
	end
end

function heap_sort(arr)
	build_heap(arr, #arr) -- make array into max heap

	for i = #arr - 1, 1, -1 do
		-- move root to end
		arr[1], arr[i + 1] = arr[i + 1], arr[1]
		
		-- max heapify the reduced heap
		heapify(arr, i, 1)
	end
end
