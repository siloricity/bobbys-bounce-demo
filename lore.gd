extends VBoxContainer
func _ready():
	var butts = RichTextLabel.new()
	butts.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	$HBoxContainer2/Control.add_sibling(butts)
 
