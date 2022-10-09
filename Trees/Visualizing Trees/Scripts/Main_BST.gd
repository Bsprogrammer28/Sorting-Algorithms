extends Binary_tree

export (PackedScene) var nodeSprite

export var radius = 64
var _ratios = [3, 4, 5]
var _tree = Branch.new(24)
var screensize = Vector2.ZERO
var root = null
var rationMultiple = 25

func _ready():
	_tree.addBranch(3)
	_tree.addBranch(2)
	_tree.addBranch(1)
	_tree.addBranch(39)
	_tree.addBranch(18)
	_tree.addBranch(50)
	_tree.addBranch(28)
	screensize = get_viewport().get_visible_rect().size
	root = _createNode(Vector2(screensize.x/2, radius), radius)

func _process(_delta):
	_createTree(root.position, _ratios, rationMultiple)
##	root.get_child("Value").text = _tree._data

func _createNode(position, size):
	var _node = nodeSprite.instance()
	add_child(_node)
	_node.position = position
	var _textureSize = _node.texture.get_size()
	var _scale = (size*2)/_textureSize.x
#	print("Scale: ", _scale, " Size: ", size, " TextureSize: ", _textureSize.x)
	_node.scale = Vector2(_scale, _scale)
	return _node

func _createTree(nodePosition: Vector2, treeRatios: Array, ratioFactor):
#	print("X: ", nodePosition.x, " Y: ", nodePosition.y, " Ratios: ", treeRatios)
	if _tree.isLeft():
		_createNode(Vector2(nodePosition.x-treeRatios[2]*ratioFactor, nodePosition.y+treeRatios[1]*ratioFactor), radius)
		_createTree(nodePosition, treeRatios, ratioFactor)
	else:
		_createNode(Vector2(nodePosition.x-treeRatios[2]*ratioFactor, nodePosition.y+treeRatios[1]*ratioFactor), radius)































#
#func _on_XAxis_value_changed(value):
#	$"PositionRefactor/X-Axis".max_value = screensize.x
#	node.position.x = value
#	$"PositionRefactor/X-Axis/Value".text = String(value)
#
#func _on_YAxis_value_changed(value):
#	$"PositionRefactor/Y-Axis".max_value = screensize.y
#	node.position.y = value
#	$"PositionRefactor/Y-Axis/Value".text = String(value)
#
#func _on_Radius_value_changed(value):
#	$"Radius".min_value = 0.0
#	$"Radius".max_value = 1.0
#	node.scale = Vector2(value, value)
#	$"Radius/Value".text = String(spriteSize.y * node.scale.y * .5)
