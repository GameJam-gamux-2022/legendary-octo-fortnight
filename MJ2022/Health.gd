extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


export var health: int = 150;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func damage(dmg):
	health -= dmg
	print_debug(health)
	pass
