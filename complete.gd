extends Sprite2D
@export var next_scene: PackedScene
func _ready():
	$AnimationPlayer.play("new_animation")
func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(next_scene)
