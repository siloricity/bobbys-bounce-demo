extends Node2D
func _ready():
	$bobby.death.connect($Overlay/retrybutton.appear)
	$failsafe.timeout.connect($Overlay/retrybutton.appear)
	$bobby.death.connect(lmao)
# finish box signal
func _on_finish_body_entered(body: Node2D) -> void:
	if body == $bobby:
		$bobby.dead = true
		$Overlay.finish()
		var dict = saveman.load_game().duplicate()
		if dict["level04"] != 1:
			dict["level04"] = 1
			dict["levels_completed"] += 1
			saveman.save_game(dict)
# move camera trigger
func lmao():
	if $Camera2D.position != Vector2.ZERO:
		$textbox2.appear()
func _on_cam_trigger_body_entered(body: Node2D) -> void:
	if body.name == "bobby":
		var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property($Camera2D,"position",Vector2(512,340),0.5)
