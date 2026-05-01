extends CanvasLayer
@export var next_scene: PackedScene
func finish():
		$retrybutton.appear()
		var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
		tween.tween_property($%complete,"position:y",330,1)
func _ready():
	$complete/AnimationPlayer.play("new_animation")
func _on_button_pressed() -> void:
	global.checkpoint_lv = 0
	get_tree().change_scene_to_packed(next_scene)
