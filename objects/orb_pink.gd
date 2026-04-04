extends Sprite2D
var enabled := true
signal checkpoint
func _on_area_2d_body_entered(body: bobby) -> void:
	if enabled == true:
		if body.collision_layer != 4: # disable if only not ghost
			disable()
func disable():
		checkpoint.emit()
		enabled = false
		self.modulate.a = 0.5
		$CPUParticles2D.modulate = Color.BLACK
