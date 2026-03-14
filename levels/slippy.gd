extends StaticBody2D
@onready var poly = $Area2D/DefiningPolygon.polygon
func _ready():
	$Area2D/Polygon2D.polygon = poly
	$CollisionPolygon2D.polygon = poly
func method():
	pass
