extends Area2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position = get_parent().position
	
func _on_area_entered(area: Area2D) -> void:
	print(area)
