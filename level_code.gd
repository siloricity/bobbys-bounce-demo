extends Node
@export var can_ghost: bool
@export var bobby_node: bobby
@export var failsafe_node: Timer
@onready var timer_node: Timer = $Timer

func _input(_InputEvent):
	if Input.is_action_just_pressed("click") and can_ghost:
	# logic to enable timer for ghost
		if bobby_node.dead == true: pass
		else:
			timer_node.start()
		if bobby_node.linear_velocity != Vector2.ZERO:
			bobby_node.dead = true
	if Input.is_action_just_released("click"):
		timer_node.stop()
		if failsafe_node and failsafe_node.is_stopped():
			failsafe_node.start()
# spawn ghosts
func _on_timer_timeout() -> void:
	var ghost = bobby_node.ghost.instantiate()
	ghost.position = bobby_node.position
	get_parent().add_child(ghost)
