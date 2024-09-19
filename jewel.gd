extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#/func _process(delta: float) -> void:
	if Input.get_action_strength("down"):
		self.position.z+=0.1
	elif Input.get_action_strength("up"):
		self.position.z-=0.1
	elif Input.get_action_strength("left"):
		self.position.x-=0.1
	elif Input.get_action_strength("right"):
		self.position.x+=0.1 
	#elif Input.get_action_strength("jump"):
		
