extends Node2D

func _ready() -> void:
	get_tree().change_scene_to_file("res://scene/load.tscn")

func _process(delta: float) -> void:
	pass;
