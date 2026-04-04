extends Control
func _on_button_pressed() -> void:
	saveman.reset_save()
	get_tree().change_scene_to_file("res://title.tscn")
func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://title.tscn")
