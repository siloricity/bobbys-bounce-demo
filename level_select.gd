extends VBoxContainer

func _ready():
	var save = saveman.load_game().duplicate()
	if save["level01"] == 1:
		$%but_l2.disabled = false
	if save["level02"] == 1:
		$%but_l3.disabled = false
	if save["level03"] == 1:
		$%but_l4.disabled = false
	if save["level04"] == 1:
		$%but_l5.disabled = false
	if save["level05"] == 1:
		$%but_l6.disabled = false
	if save["level06"] == 1:
		$%but_l7.disabled = false
	if save["level07"] == 1:
		$%but_l8.disabled = false
	if save["level08"] == 1:
		$%but_l9.disabled = false
	if save["level09"] == 1:
		$%but_l10.disabled = false
func _on_but_pressed(num: int) -> void:
	var path = "res://levels/level"
	match num:
		1: change(path+"01.tscn")
		2: change(path+"02.tscn")
		3: change(path+"03.tscn")
		4: change(path+"04.tscn")
		5: change(path+"05.tscn")
		6: change(path+"06.tscn")
		7: change(path+"07.tscn")
		8: change(path+"08.tscn")
		9: change(path+"09.tscn")
		10: change(path+"10.tscn")
func change(level):
	get_tree().change_scene_to_file(level)
func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://title.tscn")
