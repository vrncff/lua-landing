return {
	valid = function(s)
		local matching_pairs = {
			['('] = ')',
			['{'] = '}',
			['['] = ']'
		}

		local stack = {}

		for i = 1, #s do
			local chr = s:sub(i,i)

			if matching_pairs[chr] then -- stacks the opening brackets
				table.insert(stack, chr)
			elseif chr == ')' or chr == '}' or chr == ']' then -- removes the last opening bracket
				local last = table.remove(stack) 
				if matching_pairs[last] ~= chr then -- was it closed?
					return false
				end
			end
		end

		return (#stack == 0) -- stack should be empty if all brackets were closed properly
	end
}
