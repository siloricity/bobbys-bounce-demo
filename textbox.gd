extends RichTextLabel
@export_range(30,60) var text_size: int = 44
@export var auto_start: bool = true
var progress: int = 0
signal full_appear
signal full_disappear
func _ready():
	self.modulate.a = 0
	self.position.y += 40
	if text_size != 44:
		self.add_theme_font_size_override("normal_font_size", text_size)
	if auto_start:
		appear()
func appear(): ## fade in text
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self,"modulate:a",1,1.2)
	tween.parallel().tween_property(self,"position:y",self.position.y-40,1.2)
	tween.tween_callback(func():
			progress = 1
			full_appear.emit())
func _input(_InputEvent):
	if Input.is_action_just_released("click"):
		if progress == 1:
			progress = 2
			disappear()
func disappear(): ## fade out text
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	tween.tween_property(self,"modulate:a",0,1.2)
	tween.tween_callback(func():full_disappear.emit())
