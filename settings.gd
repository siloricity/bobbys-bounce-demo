extends Control
func _on_button_fscr_toggled(toggled_on: bool) -> void:
	match toggled_on:
		true:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			$%ButtonFSCR.text = "enabled"
		false:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			$%ButtonFSCR.text = "disabled"
func _on_button_rset_pressed() -> void:
	get_tree().change_scene_to_file("res://reset_menu.tscn")
func _on_button_file_pressed() -> void:
	OS.shell_show_in_file_manager(ProjectSettings.globalize_path("user://"),true)
