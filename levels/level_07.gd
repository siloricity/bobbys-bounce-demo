extends Node2D
func _ready():
	$Orb.checkpoint.connect(enable_checkpoint)
	$bobby.death.connect($Overlay/retrybutton.appear)
	$failsafe.timeout.connect($Overlay/retrybutton.appear)
	if global.checkpoint_lv == 1:
		$Orb.disable()
		$bobby.position = $Orb.position
	else:
		$textbox.appear()
func enable_checkpoint():
	if global.checkpoint_lv == 1: pass
	else:
		global.checkpoint_lv += 1
# finish box signal
func _on_finish_body_entered(body: Node2D) -> void:
	if body == $bobby:
		$bobby.dead = true
		$Overlay.finish()
		var dict = saveman.load_game().duplicate()
		if dict["level07"] != 1:
			dict["level07"] = 1
			dict["levels_completed"] += 1
			saveman.save_game(dict)
