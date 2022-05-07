extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


export var move_velocity : Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var speed = 10000
	set_linear_velocity(move_velocity * speed * delta)
	pass



func _on_Boomerang_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print_debug("opa")
	if(body.name == "Player"):
		body.get_node("Health").damage(100)
		var force = 2000
		var aux = -(position - body.position).normalized() * force
		body.move_and_slide(aux)
	pass # Replace with function body.
