extends Node2D
func _ready():
	var dict = saveman.load_game()
	$BoxContainer/HBoxContainer/LevelCount.text = str(int(dict["levels_completed"]))+" / 10 levels completed"
	$AnimationPlayer.play("bounce_title")
	$AnimationPlayer2.play("wheel_title")
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level_select.tscn")
func _on_butt_quit_pressed() -> void:
	get_tree().quit()
func _input(_InputEvent):
	if Input.is_action_pressed("ctrl") and Input.is_action_pressed("shift") and Input.is_action_just_pressed("r"):
		get_tree().change_scene_to_file("res://reset_menu.tscn")
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
func _on_savebutton_pressed() -> void:
	get_tree().change_scene_to_file("res://settings.tscn")
