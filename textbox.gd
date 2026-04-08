extends RichTextLabel
@export var text_to_use: String = ""
var progress: int = 0
func _ready():
	self.modulate.a = 0
	self.position.y += 40
	if text_to_use != "":
		self.text = text_to_use
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
