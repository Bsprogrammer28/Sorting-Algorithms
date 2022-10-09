extends Node

class_name Binary_tree

class Branch:
	var _left = null
	var _right = null
	var _data = null
	func _init(var value):
		self._data = value
	func addBranch(var value):
		if self._data > value:
			if self._left == null:
				self._left = Branch.new(value)
			else:
				self._left.addBranch(value)
		elif self._data < value:
			if self._right == null:
				self._right = Branch.new(value)
			else:
				self._right.addBranch(value)
	func searchTree(var value):
		if self._data == value:
			print("Found the requested value in tree: ", value)
		elif value > self._data and self._right != null:
			self._right.searchTree(value)
		elif value < self._data and self._left != null:
			self._left.searchTree(value)
		else:
			print(value, " doesn't exist in tree!")
	func printTree():
		if self._left != null:
			self._left.printTree()
		print(self._data)
		if self._right != null:
			self._right.printTree()
	func isLeft():
		if self._left != null:
			return false
		else:
			return true
	func isRight():
		if self._right != null:
			return false
		else:
			return true
	
