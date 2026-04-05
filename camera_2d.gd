extends Camera2D
func finish():
		$retrybutton.appear()
		var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tween.tween_property($%complete,"position:y",330,1)
