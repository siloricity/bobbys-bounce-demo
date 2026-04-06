class_name bobby
extends RigidBody2D
@onready var star := $star
@onready var line := $Line2D ## sling line
@onready var line_guide := $LineGuidance ## tells line position to tween
@onready var bump_sfx := $BumpSound ## audio node for regular tiles
@onready var roll_sfx := $RollSound ## audio node for slippery walls
@onready var roll_tmr := $RollTimer
@export var sling_multiplier:float
@export var max_sling:int
@export var ghost: PackedScene
var released := false
var dead := false
signal death

# rotate the sling
func _process(_delta):
	var mouse = get_global_mouse_position()
	var vel: Vector2 = sling_multiplier*(self.global_position-mouse)
	line.rotation = -self.rotation
	line.points[1] = line_guide.position
	#holding
	if Input.is_action_pressed("click"):
		if dead == false:
			star.show()
			line.show()
			line_guide.position=(mouse-self.global_position).limit_length(max_sling)
			$Sprite2D.look_at(mouse)
			$Sprite2D.rotation_degrees -= 90
			if global.refresh_jump == false:
				self.linear_velocity = Vector2.ZERO
			star.global_position = mouse
	#release
	if Input.is_action_just_released("click"):
		if dead == false:
			if global.refresh_jump == true:
				var init = self.linear_velocity
				self.linear_velocity = vel.limit_length(max_sling*2)
				self.linear_velocity *= Vector2(999,999).limit_length(init.length())
				global.refresh_jump = false
			star.hide()
			var tween = get_tree().create_tween().set_ease(Tween.EASE_OUT)
			tween.tween_property(line_guide,"position",Vector2.ZERO,0.1)
			self.freeze = false
			self.gravity_scale = 0
			self.linear_velocity = vel.limit_length(max_sling*2)
			self.gravity_scale = 1
# bounce or die
func _on_body_entered(body: Node) -> void:
	match body.name:
		"TileBlocks":
			bump_sound(randf_range(0.5,2))
			self.physics_material_override.bounce = 0.99
		"TileHazards":
			EXPLODES()

# Physics anti-softlock by sunshinecoco12 on Discord
func _physics_process(delta: float) -> void:
	var collision_info: KinematicCollision2D = move_and_collide(linear_velocity * delta, true)
	var ball_radius: float = 15.0
	var friction: float = 0.3
	if collision_info:
		# really stupid way of knowing if its a slippery wall
		if collision_info.get_collider().has_method("method"):
			self.physics_material_override.bounce = 0
			roll_sound(true)
		else:
			self.physics_material_override.bounce = 0.99
			roll_sound(false)
		angular_velocity = -linear_velocity.dot(collision_info.get_normal().orthogonal()) / ball_radius * friction
	else: roll_sound(false)
## collide sound for regular tiles
func bump_sound(pitch):
	bump_sfx.pitch_scale = pitch
	bump_sfx.play()
## roll sound for slippery walls
func roll_sound(play: bool):
	if play == true:
		roll_tmr.stop()
		if not roll_sfx.playing:
			roll_sfx.play()
	if play == false:
		if roll_tmr.is_stopped():
			roll_tmr.start()
func _on_roll_timer_timeout() -> void:
	roll_sfx.stop()
## death sfx
func EXPLODES():
	self.sleeping = true
	dead = true
	death.emit()
	$Sprite2D.modulate.a = 0
	$DeathFX.emitting = true
	$DeathSound.play()
