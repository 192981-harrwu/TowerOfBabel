extends Node2D

@export var spawner_prefab : PackedScene

func _on_timer_timeout() -> void:
	var spawner = spawner_prefab.instantiate()
	var x = randi_range(-500, 500)
	var y = randi_range(-500, 500)
	spawner.start_pos = Vector2(x, y)
	add_child(spawner)
	pass
