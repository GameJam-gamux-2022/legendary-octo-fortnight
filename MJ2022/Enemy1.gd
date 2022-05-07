extends KinematicBody2D


onready var player = get_node("../Player")


var speed = 10000
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(player == null || global_position == null):
		return
	var velocity = (global_position - player.global_position).normalized() * (-1)
	
	move_and_slide(velocity * speed * delta)
