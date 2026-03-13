extends Sprite2D
var enabled := true

func _on_area_2d_body_entered(body: RigidBody2D) -> void:
	if enabled == true:
		body.linear_velocity *= 1.6
		if body.collision_layer != 4:
			disable()
func disable():
		enabled = false
		self.modulate.a = 0.5
		$CPUParticles2D.modulate = Color.BLACK
