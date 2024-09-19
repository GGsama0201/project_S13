extends RigidBody3D

var mouse_sensitivity := 0.001
var twist_input := 0.0
var pitch_input := 0.0

@onready var twist_pivot := $TwistPivot
@onready var pitch_pivot := $TwistPivot/PitchPivot


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var input:= Vector3.ZERO
	input.x = Input.get_axis("move_left","move_right")
	input.z = Input.get_axis("move_forward","move_backward")
	
	apply_central_force(input * 1200 * delta)
	
	if  Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	twist_pivot.rotate_y(twist_input)
	pitch_pivot.rotate_x(pitch_input)
	pitch_pivot.rotation.x = clamp(pitch_pivot.rotation.x,
		deg_to_rad(-60),deg_to_rad(-30))
	twist_pivot.rotation.y = clamp(twist_pivot.rotation.y,
		deg_to_rad(-45),deg_to_rad(45))
			
	twist_input = 0.0
	pitch_input = 0.0
	
		
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() ==Input.MOUSE_MODE_CAPTURED:
			twist_input = mouse_sensitivity * event.relative.x
			pitch_input = mouse_sensitivity * event.relative.y
		
