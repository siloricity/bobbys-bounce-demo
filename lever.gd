extends Node2D
func _on_button_toggled(toggled_on: bool) -> void:
	$Sprite2D.flip_h = toggled_on
	$Sprite2D.material.set_shader_parameter("activated",toggled_on)
