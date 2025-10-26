extends TileMapLayer

func _ready():
	for cell in get_used_cells():
		var tile_data: TileData = get_cell_tile_data(cell)
		tile_data.z_index = int(map_to_local(cell).y)
	
	for cell in get_used_cells():
		if get_cell_atlas_coords(cell) == Vector2i(1,0):
			print(get_cell_tile_data(cell).z_index)
