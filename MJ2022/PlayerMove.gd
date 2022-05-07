extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var move_velocity = Vector2()

onready var boomerang = preload("res://Boomerang.tscn")


# Called when the node enters the scene tree for the first time.
func _process(delta):
	move_velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		move_velocity.y = -1;
	if Input.is_action_pressed("ui_down"):
		move_velocity.y = 1;
	if Input.is_action_pressed("ui_left"):
		move_velocity.x = -1;
	if Input.is_action_pressed("ui_right"):
		move_velocity.x = 1;
		
	if Input.is_action_pressed("ui_page_down"):
		throw()
		
	move_velocity = move_velocity.normalized()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var speed = 5000
	move_and_slide(move_velocity * speed * delta)
	pass

var root = get_tree().get_root()
func throw():
	var b = boomerang.instance()
	#b.set_pos(Vector2())
	root.add_child(b)
	
	pass
