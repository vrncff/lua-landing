local function flatten(input, result)
	result = result or {} -- result will be provided for recursive calls

	for _, val in ipairs(input) do
		if type(val) == 'table' then
			flatten(val, result)
		elseif val ~= nil then
			table.insert(result, val)
		end
	end

	return result
end

return flatten
