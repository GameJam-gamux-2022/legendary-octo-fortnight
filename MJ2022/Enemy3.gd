extends RigidBody2D

var cte = 3
var cooldown = 0
var projectile = preload("../Boomerang.tscn")
onready var root = get_tree().get_root()


var k = 100

func shoot(n):
	var rot_angle = 2 * PI / (n) 
	
	for i in range(n):
		var p = projectile.instance()
		
		var rot = i * rot_angle
		
		var ori = Vector2(cos(rot), sin(rot)) 
		
		p.position = position + k * ori
		
		root.add_child(p)
		
		p.move_velocity = ori
		
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

export var qtdShoots = 20
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if cooldown <= 0:
		shoot(qtdShoots)
		cooldown = cte
		return
	cooldown -= delta
	pass

