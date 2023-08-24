@tool
extends Node2D

class_name StackedSprite

var childrenRotation = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offset_layers(2.5)
	transfer_rotation()

func transfer_rotation():
	if global_rotation != 0:
		for child in get_children():
			child.rotation += global_rotation
			childrenRotation += global_rotation
		global_rotation = 0



func offset_layers(y=4):
	var totalYOffset = 0
	for child in get_children():
		child.position.y = totalYOffset
		if not child is CollisionObject2D:
			
			child.z_index = -totalYOffset / 2
			totalYOffset -= y
