extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var cooldown = 15
func _process(delta):
	cooldown -= delta
	
	#if(cooldown <= 0):
		#queue_free()
	#pass

	
	pass # Replace with function body.


func _on_Boomerang2_body_entered(body):
	if(body.name == "Player") || "Enemy" in body.name:
		body.get_node("Health").damage(100)
		var force = 2000
		var aux = -(position - body.position).normalized() * force
		if(body is KinematicBody2D):
			body.move_and_slide(aux)
	pass # Replace with function body.
