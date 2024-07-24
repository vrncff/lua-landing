function quick_sort(arr)
	local function qsort_recursive(arr, start, finish)
		if start < finish then
			local pivot = arr[finish] -- Lomuto
			local i = start
			for j = start, finish - 1 do
				if arr[j] < pivot then -- move elements smaller than the pivot to the left
					arr[i], arr[j] = arr[j], arr[i]
					i = i + 1
				end
			end
			arr[i], arr[finish] = arr[finish], arr[i] -- place pivot in correct position

			-- recursive calls for left and right subarrays
			qsort_recursive(arr, start, i - 1)
			qsort_recursive(arr, i + 1, finish)
		end
	end

	qsort_recursive(arr, 1, #arr)
end
