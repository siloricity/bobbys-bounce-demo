extends RigidBody2D
@export var sling_multiplier:float
@export var max_sling:int
var released := false
# rotate the sling
func _process(_delta):
	var mouse = get_global_mouse_position()
	var vel: Vector2 = sling_multiplier*(self.global_position-mouse)
	if Input.is_action_pressed("click"):
		self.look_at(mouse)
		self.rotation_degrees -= 90
		self.linear_velocity = Vector2.ZERO
	if Input.is_action_just_released("click"):
		self.freeze = false
		self.gravity_scale = 0
		self.linear_velocity = vel
		self.gravity_scale = 1
