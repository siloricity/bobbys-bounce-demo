extends Node2D
var attatchx
var attatchy
func _ready():
	$bobby.death.connect($Overlay/retrybutton.appear)
	$failsafe.timeout.connect($Overlay/retrybutton.appear)
	$Orb5.checkpoint.connect(enable_checkpoint)
	if global.checkpoint_lv == 1:
		$Orb5.disable()
		$bobby.position = $Orb5.position
	else:
		$textbox.appear()
# finish box signal
func _on_finish_body_entered(body: Node2D) -> void:
	if body == $bobby:
		$bobby.dead = true
		$Overlay.finish()
		var dict = saveman.load_game().duplicate()
		if dict["level09"] != 1:
			dict["level09"] = 1
			dict["levels_completed"] += 1
			saveman.save_game(dict)
func enable_checkpoint():
	if global.checkpoint_lv == 1: pass
	else:
		global.checkpoint_lv += 1
func _on_cam_trigger_body_entered(body: Node2D) -> void:
	if body is bobby:
		attatchx = true
func _on_cam_trigger_2_body_entered(body: Node2D) -> void:
	if body is bobby:
			attatchy = true
func _process(_delta):
	if attatchx:
		$Camera2D.position.x = $bobby.position.x
	if attatchy:
		$Camera2D.position.y = $bobby.position.y
