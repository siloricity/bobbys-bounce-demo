extends Node
@onready var quack = preload("res://mystery.tscn")
var checkpoint_lv: int = 0
func _input(_InputEvent):
	if Input.is_action_just_pressed("esc"):
		get_tree().change_scene_to_file("res://title.tscn")
	if Input.is_action_just_pressed("r"):
		get_tree().reload_current_scene()
	if Input.is_action_just_pressed("g"):
		add_child(quack.instantiate())
func _ready():
	if OS.get_name() != "Android" || "iOS" || "Web":
		DiscordRPC.app_id = 1482445160360050882
		DiscordRPC.details = "boing"
		DiscordRPC.refresh()
