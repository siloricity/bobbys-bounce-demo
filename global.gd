extends Node
@onready var quack = preload("res://mystery.tscn")
var checkpoint_lv: int = 0
var scenelist: Array
func _input(_InputEvent):
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://title.tscn")
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("g"):
		add_child(quack.instantiate())
func _ready():
	#get_tree().scene_changed.connect(scenes)
	if OS.get_name() != "Android" || "iOS" || "Web":
		DiscordRPC.app_id = 1482445160360050882
		DiscordRPC.details = "boing"
		DiscordRPC.refresh()
#func scenes():
	#scenelist.push_back(get_tree().current_scene.get_path())
	#if scenelist.size() >= 3:
		#scenelist.pop_front()
	#print(scenelist)
