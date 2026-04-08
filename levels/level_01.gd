extends Node2D
var progress: int = 0
func _ready():
	$bobby.dead = true
func _on_textbox_full_appear() -> void:
	if progress == 4: progress = 2
	else:
		await get_tree().create_timer(0.4).timeout
		$textbox2.appear()
func _on_textbox_2_full_appear() -> void:
		$bobby.dead = false
		progress = 1
func _input(_InputEvent):
	if Input.is_action_just_pressed("click"): global.refresh_jump = true
	if Input.is_action_just_released("click"):
		match progress:
			1:
				$textbox.disappear()
				$textbox2.disappear()
				$Timer2.start()
			2:	if $Timer2.is_stopped():
				progress = 3
				$textbox.disappear()
				await get_tree().create_timer(1.0).timeout
				var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
				tween.tween_property($finish,"position:y",528,1)
func _on_timer_2_timeout() -> void:
	progress = 4
	$textbox.text = "drag to fling bobby around"
	$textbox.appear()
# finish box signal
func _on_finish_body_entered(_body: Node2D) -> void:
	$Overlay.finish()
	var dict = saveman.load_game().duplicate()
	if dict["level01"] != 1:
		dict["level01"] = 1
		dict["levels_completed"] += 1
		saveman.save_game(dict)
# next level
func _on_comp_button_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/level02.tscn")
