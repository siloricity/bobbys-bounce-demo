extends VBoxContainer
@onready var fontsize = $HBoxContainer2/RichTextLabel.get_theme_font_size("normal_font_size")
func _ready():
	$HBoxContainer2/RichTextLabel.queue_free()
	var butts = RichTextLabel.new()
	butts.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	if FileAccess.file_exists("user://test.txt"):
		butts.text = FileAccess.get_file_as_string("user://test.txt")
	butts.add_theme_font_size_override("normal_font_size",fontsize)
	$HBoxContainer2/Control.add_sibling(butts)
	
