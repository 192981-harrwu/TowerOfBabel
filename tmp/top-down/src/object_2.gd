extends Area2D

class_name obj2
@onready var explosion = preload("res://scenes/gpu_particles_2d.tscn")
var speed = 10

func _ready() -> void:
	position = Vector2(0, -220)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed;
	if (position.y >= 220):
		position = Vector2(0, -220)
	


func _on_area_entered(area: Area2D) -> void:
	print("e")
	var explosion_ = explosion.instantiate()
	explosion_.position = position 
	get_parent().add_child(explosion_)
	position.y += speed;
