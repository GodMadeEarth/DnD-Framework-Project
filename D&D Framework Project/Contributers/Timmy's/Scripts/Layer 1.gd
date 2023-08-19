@tool
extends Node2D

var currentRotation = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotation != 0:
		for child in get_children():
			child.rotation += rotation
		currentRotation += rotation
		rotation = 0

