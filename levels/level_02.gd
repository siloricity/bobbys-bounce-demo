extends Node2D
func its_okay():
	$textbox.text = "it's okay to fail"
	$textbox.appear(true)
	$Overlay/retrybutton.appear()
# finish box signal
func _on_finish_body_entered(body: Node2D) -> void:
	if body == $bobby:
		$bobby.dead = true
		$Overlay.finish()
		var dict = saveman.load_game().duplicate()
		if dict["level02"] != 1:
			dict["level02"] = 1
			dict["levels_completed"] += 1
			saveman.save_game(dict)
