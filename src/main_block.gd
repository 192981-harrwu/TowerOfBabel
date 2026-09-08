extends Node2D
@onready var small = preload("res://scene/blocks/small.tscn")
@onready var medium = preload("res://scene/blocks/medium.tscn")
@onready var large = preload("res://scene/blocks/large.tscn")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var block
