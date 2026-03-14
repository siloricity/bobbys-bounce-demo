extends StaticBody2D
@onready var poly = $Area2D/DefiningPolygon.polygon
func _ready():
	$Area2D/Polygon2D.polygon = poly
	$CollisionPolygon2D.polygon = poly
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.collision_layer == 2 or 3:
		body.physics_material_override.bounce = -1
