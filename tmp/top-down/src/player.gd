extends CharacterBody2D

class_name player
const SPEED = 300.0


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("GD_LEFT", "GD_RIGHT", "GD_UP", "GD_DWN")
	velocity = direction * SPEED
	
	move_and_slide()
	
