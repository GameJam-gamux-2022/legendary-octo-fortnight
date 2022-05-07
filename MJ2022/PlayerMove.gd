extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var move_velocity = Vector2()
var ori = Vector2()

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
		
	if Input.is_action_pressed("ui_shoot") && cooldown_shoot <= 0 :
		throw()
	else:
		cooldown_shoot -= delta
		
	if Input.is_action_pressed("Recall") && cooldown_recall <= 0 :
		recall()
	else:
		cooldown_recall -= delta
		uncall()
		
	move_velocity = move_velocity.normalized()
	if(move_velocity != Vector2()):
		ori = move_velocity;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var speed = 50000
	move_and_slide(move_velocity * speed * delta)
	pass

onready var root = get_tree().get_root()
var cooldown_shoot = 0;
var b;
func throw():
	cooldown_shoot = 10
	b = boomerang.instance()
	b.position = position + ori * 70
	
	root.add_child(b)

	b.move_velocity = ori
	
	pass
	
var cooldown_recall = 0
onready var gravity : Area2D = $Gravity 
func recall():
	cooldown_recall = 2
	gravity.gravity = 10000
	gravity.linear_damp = 8
	
	pass
	
func uncall():
	if(cooldown_recall <= 1):
		gravity.gravity = 1000
		gravity.linear_damp = 0.8
	
	pass
