extends KinematicBody2D

onready var player = get_node("../Player")
var boost = 80000
var lim = 2
var cooldown = 2
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func get_dir(p):
	return (global_position - p.global_position).normalized() * (-1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if cooldown == lim: 
		velocity = get_dir(player)
		move_and_slide(velocity * boost * delta)

	elif cooldown < lim && cooldown > 0:
		move_and_slide(velocity * boost * delta)

	elif cooldown < lim:
		cooldown = lim
		return

	cooldown -= delta
