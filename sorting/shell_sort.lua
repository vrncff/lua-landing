function shell_sort(arr, gaps)
	gaps = gaps or {701, 301, 132, 57, 23, 10, 4, 1} -- Ciura gap sequence as default

	for _, gap in ipairs(gaps) do
		for i = gap + 1, #arr do -- inner insertion sort
			local key = arr[i]
			local j = i

			while j > gap and arr[j - gap] > key do -- makes sure its not out of bounds
				arr[j] = arr[j - gap]
				j = j - gap
			end

			arr[j] = key
		end
	end
end
