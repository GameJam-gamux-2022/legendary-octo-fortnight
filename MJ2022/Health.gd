extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


export var health: int;
export var is_player: bool = false;
var kill = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func damage(dmg):
	health -= dmg
	
	if(is_player && !kill):
		print_debug("perdeu playboy")
		#get_tree().quit()
	else:
		var d = get_node("../")
		get_node("../../GameManager").kill()
		
		#d.hide()
		d.queue_free()
	pass
