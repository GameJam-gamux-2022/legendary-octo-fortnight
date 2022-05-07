extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


export var move_velocity = Vector2(0, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var speed = 10000
	move_and_slide(move_velocity * speed * delta)
	pass
