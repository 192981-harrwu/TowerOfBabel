extends Area2D
class_name obj1
@onready var explosion = preload("res://scenes/gpu_particles_2d.tscn")

var speed = 10

func _ready() -> void:
	position = Vector2(0, 0)

func _process(delta: float) -> void:
	position.x += speed
	if (position.x >= 220):
		position = Vector2(-220, 0	)
		speed += 1


func _on_object_2_area_entered(area: Area2D) -> void:
	if (area is obj2):
		print("e")
		var explosion_ = explosion.instantiate()
		explosion_.position = position 
		get_parent().add_child(explosion_)
		queue_free()
