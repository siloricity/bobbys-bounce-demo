extends Button
func _on_pressed() -> void:
	get_tree().reload_current_scene()
func appear():
	disabled = false
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(self,"modulate:a",1,1.2)
