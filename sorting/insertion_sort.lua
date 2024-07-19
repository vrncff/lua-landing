function insertion_sort(arr)
	for i = 2, #arr do
		local key = arr[i] -- keep track of current key
		local j = i

		while j > 1 and arr[j - 1] > key do
			arr[j] = arr[j - 1] -- shift to the right
			j = j - 1
		end

		arr[j] = key -- directly put the key in the right place
		i = i + 1
	end
end
