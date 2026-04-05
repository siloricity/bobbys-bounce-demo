extends Node
func _ready():
	if OS.get_name() != "Android" || "iOS" || "Web":
		DiscordRPC.app_id = 1482445160360050882
		DiscordRPC.details = "boing"
		DiscordRPC.refresh()
