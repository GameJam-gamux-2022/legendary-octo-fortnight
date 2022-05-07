extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var qtdToKill: int
export var nextScene: String


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func kill():
	qtdToKill -= 1
	if qtdToKill <= 0:
		get_node("../Player").toDestroy();
		var t = Timer.new()
		t.set_wait_time(3)
		t.set_one_shot(true)
		self.add_child(t)
		t.start()
		yield(t, "timeout")
		get_tree().change_scene(nextScene)
		
		
	pass
