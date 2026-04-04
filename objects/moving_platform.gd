extends RigidBody2D
func _ready():
	$CollisionShape2D/ColorRect.size = $CollisionShape2D.shape.size
	$CollisionShape2D/ColorRect.set_position(-$CollisionShape2D/ColorRect.size/2)
