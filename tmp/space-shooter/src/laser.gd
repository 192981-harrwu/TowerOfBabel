extends Area2D
class_name laser
@export var speed = 250

func _physics_process(delta: float) -> void:
	position.x += speed * delta
