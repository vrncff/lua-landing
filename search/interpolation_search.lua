function interpolation_search(arr, query)
	local lo = 1
	local hi = #arr

	while lo <= hi and query >= arr[lo] and query <= arr[hi] do
		if lo == hi then
			if arr[lo] == query then
				return lo
			end

			return -1
		end

		local guess = lo + math.floor( (query - arr[lo]) * (hi - lo) / (arr[hi] - arr[lo]) ) -- linear interpolation

		if arr[guess] == query then
			return guess
		end

		-- reduce search space
		if arr[guess] < query then
			lo = guess + 1
		else
			hi = guess - 1
		end

	end

	return -1
end
