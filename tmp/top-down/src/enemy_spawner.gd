extends Node2D
@export var enemy_prefab : PackedScene
@export var target : Node2D
@export var start_pos : Vector2

func _on_timer_timeout() -> void:
	position = start_pos
	var enemy = enemy_prefab.instantiate()
	enemy.player = target
	add_child(enemy) 
	pass
	
