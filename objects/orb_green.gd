extends Sprite2D
var enabled := true

func _on_area_2d_body_entered(body: bobby) -> void:
	if enabled == true and body.has_method("bump_sound"):
		body.dead = false
		global.refresh_jump = true
		disable()
func disable():
		enabled = false
		self.modulate.a = 0.5
		$CPUParticles2D.modulate = Color.BLACK
