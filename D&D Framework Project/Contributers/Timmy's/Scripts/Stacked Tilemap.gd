@tool
extends StackedSprite



func _process(delta):
	offset_layers(2.5)
	transfer_rotation()


var referencedTiles = []
func stack_tiles(referenceLayer = 1):
	var referenceTilemap:TileMap = get_child(referenceLayer)
	if referencedTiles == []:
		referencedTiles = referenceTilemap.get_used_cells(0)
	
	for tile in referencedTiles:
		var referenceTile:Vector2i = tile
		var referenceAtlas:Vector2i = referenceTilemap.get_cell_atlas_coords(0,referenceTile)
		var currentLayer = 0
		var children : Array = get_children()
		children.reverse()
		for tilemap in children:
			if tilemap is TileMap:
				if referenceAtlas.x > -1:
					tilemap.set_cell(0,referenceTile,0,Vector2i(referenceAtlas.x,currentLayer))
				else:
					tilemap.erase_cell(0,referenceTile)
				currentLayer += 1
	
	referencedTiles = referenceTilemap.get_used_cells(0)


func _on_tile_map_2_changed():
	stack_tiles()
