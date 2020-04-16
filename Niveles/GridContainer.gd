extends YSort

var tile_size = get_cell_size()
var half_tile_size = get_cell_size() / 2

var grid_size = Vector2(256,128)
var grid = []


# Called when the node enters the scene tree for the first time.
func _ready():
	for _x in range(grid.size.x):
		grid.append([])
		for _x in range(grid_size.y):
			grid[_x].append(null)

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
