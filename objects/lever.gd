extends Node2D
var toggle: bool
func _ready():
	$Sprite2D.material.set_shader_parameter("activated",false)
func _physics_process(_delta) -> void:
	$Sprite2D.flip_h = toggle
	$Sprite2D.material.set_shader_parameter("activated",toggle)
func _on_button_pressed() -> void:
	toggle = not toggle
