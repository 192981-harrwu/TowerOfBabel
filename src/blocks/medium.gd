extends StaticBody2D
class_name mediumBlock

var direction = 1

func _ready() -> void:
	position.x = 0 

func _process(delta: float) -> void:
	position.x += 100 * delta * direction
	if position.x <= -50: position.x = -50; direction = 1;
	elif position.x >= 50: position.x = 50; direction = -1;
	
	print(position.x)
