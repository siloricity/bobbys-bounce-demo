extends Button
func _on_pressed() -> void:
	get_tree().reload_current_scene()
func appear(): ## fade in the retry button
	disabled = false
	get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT).tween_property(self,"modulate:a",1,1.2)
