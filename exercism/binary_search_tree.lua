local BinarySearchTree = {}
BinarySearchTree.__index = BinarySearchTree

-- Returns new tree
function BinarySearchTree:new(val)
	local tree = setmetatable({}, self)

	tree.value = val
	tree.left = nil
	tree.right = nil

	return tree
end

-- Inserts element
function BinarySearchTree:insert(val)
	if val <= self.value then -- insert to the left
		if self.left == nil then
			self.left = BinarySearchTree:new(val)
		else
			self.left:insert(val) -- recursive call
		end
	else -- same for right
		if self.right == nil then
			self.right = BinarySearchTree:new(val)
		else
			self.right:insert(val)
		end
	end
end

-- Creates tree from list
function BinarySearchTree:from_list(arr)
	if #arr == 0 then
		error("Can't create tree from empty list")
	end

	local tree = BinarySearchTree:new(table.remove(arr, 1)) -- removes first value from list, creates tree

	for _, val in ipairs(arr) do
		tree:insert(val)
	end

	return tree
end

-- Returns iterator for values in ascending order (in order traversal), recursive implementation
function BinarySearchTree:values()
	local function inorder(node)
		if node.left then
			inorder(node.left) -- recur on left
		end

		coroutine.yield(node.value)

		if node.right then
			inorder(node.right) -- recur on right
		end
	end

	return coroutine.wrap(function()
		inorder(self)
	end)
end

return BinarySearchTree
