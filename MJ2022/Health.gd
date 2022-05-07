extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


export var health: int;
export var is_player: bool = false;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func damage(dmg):
	health -= dmg
	
	if(is_player):
		get_tree().quit()
	else:
		var d = get_node("../")
		d.hide()
		d.queue_free()
	pass
