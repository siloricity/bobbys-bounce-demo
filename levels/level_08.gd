extends Node2D
func _ready():
	$slippy2.collision_layer = 0
	$BlendingCircle/Panel.material.set_shader_parameter("a",Vector3(3,1,0.8))
	$slippy2.modulate.a = 0.2
	$bobby.death.connect($Overlay/retrybutton.appear)
# finish box signal
func _on_finish_body_entered(body: Node2D) -> void:
	if body == $bobby:
		$bobby.dead = true
		$Overlay.finish()
		var dict = saveman.load_game().duplicate()
		if dict["level08"] != 1:
			dict["level08"] = 1
			dict["levels_completed"] += 1
			saveman.save_game(dict)
# Lever switch thingamabob button
func _on_button_pressed() -> void:
	if $slippy2/Area2D.get_overlapping_bodies():
		$Lever.toggle = false
	if $slippy/Area2D.get_overlapping_bodies():
		$Lever.toggle = true
	match $Lever.toggle:
		true:
			$slippy2.collision_layer = 1
			$slippy2.modulate.a = 1
			$slippy.collision_layer = 0
			$slippy.modulate.a = 0.2
			$BlendingCircle/Panel.material.set_shader_parameter("a",Vector3(1,3,0.8))
		false:
			$slippy2.collision_layer = 0
			$slippy2.modulate.a = 0.2
			$slippy.collision_layer = 1
			$slippy.modulate.a = 1
			$BlendingCircle/Panel.material.set_shader_parameter("a",Vector3(3,1,0.8))
# Camera on bobby if you find secret
var secrets
func _on_cam_trigger_body_entered(_body: Node2D) -> void:
	secrets = true
func _process(_float):
	if secrets == true:
		$Camera2D.position = $bobby.position - get_viewport_rect().size/2
