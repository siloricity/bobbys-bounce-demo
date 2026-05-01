extends Control
var wind: bool
func _ready():
	if DisplayServer.window_get_mode() == 3:
		$%ButtonFSCR.button_pressed = true
		wind = true
	update_wind()
	if OS.get_name() == "Android":
		$%ButtonFILE.modulate.a = 0.3
		$VBoxContainer/HBoxContainer/VBoxContainer/savelocation/RichTextLabel.modulate.a = 0.3
		$%ButtonFILE.disabled = true
		$%ButtonFSCR.modulate.a = 0.3
		$VBoxContainer/HBoxContainer/VBoxContainer/fullscreen/RichTextLabel.modulate.a = 0.3
		$%ButtonFSCR.disabled = true
func _on_button_fscr_toggled(toggled_on: bool) -> void:
	match toggled_on:
		true:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			wind = true
		false:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			wind = false
	update_wind()
func _on_button_rset_pressed() -> void:
	get_tree().change_scene_to_file("res://reset_menu.tscn")
func _on_button_file_pressed() -> void:
	OS.shell_show_in_file_manager(ProjectSettings.globalize_path("user://"),true)
func update_wind():
	match wind:
		false:	$%ButtonFSCR.text = "disabled"
		true:	$%ButtonFSCR.text = "enabled"
func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://title.tscn")
