extends Node2D
var progress: int = 0
func _ready():
	$slippy2.collision_layer = 0
	$slippy2.modulate.a = 0.2
	$bobby.death.connect(its_okay)
	# intro sequence animation
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property($welcome,"modulate:a",1,1.2)
	tween.parallel().tween_property($welcome,"position:y",100,1.2)
	progress = 1
func _input(_InputEvent):
	if Input.is_action_just_pressed("click"):
		if progress == 1: # fade out intro sequence
			var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tween.tween_property($welcome,"modulate:a",0,1.2)
	# logic to enable timer for ghost
		if $bobby.dead == true: pass
		else:
			$Timer.start()
		if $bobby.linear_velocity != Vector2.ZERO:
			$bobby.dead = true
	if Input.is_action_just_released("click"):
		$Timer.stop()
		if $failsafe.is_stopped():
			$failsafe.start()
func its_okay():
	$Camera2D/retrybutton.appear()
# spawn ghosts
func _on_timer_timeout() -> void:
	var ghost = $bobby.ghost.instantiate()
	ghost.position = $bobby.position
	add_child(ghost)
# finish box signal
func _on_finish_body_entered(body: Node2D) -> void:
	if body == $bobby:
		$bobby.dead = true
		$Camera2D.finish()
		var dict = saveman.load_game().duplicate()
		if dict["level07"] != 1:
			dict["level07"] = 1
			dict["levels_completed"] += 1
			saveman.save_game(dict)
## move to next level
func next_level() -> void:
	global.checkpoint_lv = 0
	get_tree().change_scene_to_file("res://title.tscn")
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
		false:
			$slippy2.collision_layer = 0
			$slippy2.modulate.a = 0.2
			$slippy.collision_layer = 1
			$slippy.modulate.a = 1
var secrets
func _on_cam_trigger_body_entered(_body: Node2D) -> void:
	secrets = true
func _process(_float):
	if secrets == true:
		$Camera2D.position = $bobby.position - get_viewport_rect().size/2
	
