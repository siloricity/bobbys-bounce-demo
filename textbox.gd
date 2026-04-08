extends RichTextLabel
@export var text_to_use: String = ""
@export_range(30,60) var text_size: int = 44
var progress: int = 0
func _ready():
	self.modulate.a = 0
	self.position.y += 40
	if text_to_use != "":
		self.text = text_to_use
	if text_size != 44:
		self.add_theme_font_size_override("normal_font_size", text_size)
	# intro sequence animation
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self,"modulate:a",1,1.2)
	tween.parallel().tween_property(self,"position:y",self.position.y-40,1.2)
	progress = 1
func _input(_InputEvent):
	if Input.is_action_just_pressed("click"):
		if progress == 1: # fade out intro sequence
			progress = 2
			var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
			tween.tween_property(self,"modulate:a",0,1.2)
