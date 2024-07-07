return function(arr, query)
	local left = 1
	local right = #arr

	while left <= right do
		local mid = math.floor((left + right) / 2)

		if arr[mid] == query then
			return mid -- query found at mid index

		elseif arr[mid] < query then
			left = mid + 1 -- search to the right of mid

		else
			right = mid - 1 -- search to the left of mid
		end
	end

	return -1 -- not found
end
