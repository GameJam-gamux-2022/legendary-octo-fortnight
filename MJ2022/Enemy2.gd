extends KinematicBody2D

onready var player = get_node("../Player")
var boost = 75000
var collision = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func vector_module(vector):
	return sqrt(pow(vector.x,2) + pow(vector.y,2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if collision == 0:
		var target = player.global_position
		var distance = vector_module(global_position.distance_to(target))
		var time = distance / boost
		var velocity = (global_position - target).normalized()
	move_and_slide(velocity * boost)
	collision 	
#	pass
