extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	$World.rotation_degrees += 50 * delta
