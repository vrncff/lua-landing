function newLinkedList()
	-- creates a node
	function newNode(val)
		return {
			value = val,
			prev = nil,
			next = nil
		}
	end

	-- creates empty linked list
	local LinkedList = {
		head = nil,
		tail = nil,
		size = 0
	}

	-- returns number of elements
	function LinkedList:count()
		return self.size
	end

	-- adds an element to the start
	function LinkedList:unshift(val)
		local node = newNode(val)

		if self.head == nil then -- list is empty
			self.head = node
			self.tail = node
		else -- list is not empty
			node.next = self.head
			self.head.prev = node
			self.head = node
		end

		self.size = self.size + 1
	end

	-- removes an element from the start
	function LinkedList:shift()
		if self.head == nil then -- list is empty 
			return nil
		end

		local removed = self.head

		self.head = self.head.next
		self.size = self.size - 1

		return removed.value
	end

	-- adds an element to the end
	function LinkedList:push(val)
		local node = newNode(val)

		if self.head == nil then -- list is empty
			self.head = node
			self.tail = node
		else -- list is not empty
			node.prev = self.tail
			self.tail.next = node
			self.tail = node
		end

		self.size = self.size + 1
	end

	-- removes an element from the end
	function LinkedList:pop()
		if self.head == nil then -- list is empty 
			return nil
		end

		local removed = self.tail

		self.tail = self.tail.prev
		self.size = self.size - 1

		return removed.value
	end

	-- removes matching values from any point
	function LinkedList:delete(val)
		local current = self.head -- traversal starts at head

		while current do 
			if current.value == val then -- value found
				-- adjust next and prev nodes
				if current.prev then -- there is a previous node
					current.prev.next = current.next
				end
				if current.next then -- there is a next node
					current.next.prev = current.prev
				end

				-- adjust head and tail
				if self.head == current then
					self.head = current.next
				end
				if self.tail == current then
					self.tail = current.prev
				end

				self.size = self.size - 1
			end

			current = current.next
		end

		return nil -- value not found
	end

	return LinkedList
end

return function()
	return newLinkedList()
end
