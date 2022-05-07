extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _on_Area2D_body_entered(body):
	#if(body.name == "Player"):
	#	body.get_node("Health").damage(100)
	#	print_debug("Opa")
	#pass # Replace with function body.


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if(body.name == "Player"):
		body.get_node("Health").damage(100)
		var force = 10000
		var aux = (position - body.position).normalized() * force
		body.move_and_slide(aux)
	pass # Replace with function body.
