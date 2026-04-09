extends Node2D
var progress: int = 0
func _ready():
	$bobby.death.connect(its_okay)
func its_okay():
	$textbox.text = "it's okay to fail"
	$textbox.appear(true)
	$Overlay/retrybutton.appear()
func _input(_InputEvent):
	if $bobby.linear_velocity != Vector2.ZERO:
			$bobby.dead = true
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
