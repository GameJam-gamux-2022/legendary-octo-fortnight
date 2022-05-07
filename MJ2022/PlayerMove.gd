extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var move_velocity = Vector2()
var ori = Vector2()

onready var boomerang = preload("res://Boomerang2.tscn")


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


onready var sprd = preload("res://Sprites separados/char_front.png")
onready var spru = preload("res://Sprites separados/char_back.png")
onready var sprl = preload("res://Sprites separados/char_left.png")
onready var sprr = preload("res://Sprites separados/char_right.png")

onready var sprite = get_node("Icon")
func flip():
	if ori.x < 0:
		sprite.texture = sprl
	if ori.x > 0:
		sprite.texture = sprr
	if ori.y < 0:
		sprite.texture = spru
	if ori.y > 0:
		sprite.texture = sprd
	
	
	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var speed = 25000
	move_and_slide(move_velocity * speed * delta)
	flip()
	pass

onready var root = get_tree().get_root()
var cooldown_shoot = 0;
var b;
func throw():
	cooldown_shoot = 1
	b = boomerang.instance()
	b.position = position + ori * 90
	
	root.add_child(b)

	var initial_speed = 1000
	b.set_linear_velocity(ori * initial_speed)
	
	var angle = b.position.angle_to_point(b.position + ori)
	b.get_node("Sprite").rotation = (angle) + PI
	
	pass
	
var cooldown_recall = 0
onready var gravity : Area2D = $Gravity 
func recall():
	cooldown_recall = 5
	gravity.gravity = 5000
	gravity.linear_damp = 1.2
	
	pass
	
func uncall():
	if(cooldown_recall <= 3):
		gravity.gravity = 1000
		gravity.linear_damp = 0.8
	
	pass
