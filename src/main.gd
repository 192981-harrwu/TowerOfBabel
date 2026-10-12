extends Node2D
class_name main

const BUILD = preload("res://scene/build.tscn")
const WALK = preload("res://scene/walk.tscn")
const TEST = preload("res://scene/test.tscn")

var GLOBAL_VAL = 0;
var isBuilding = true; # true  for building stacking part false for walking the built part
var scene;

func _ready() -> void:
	if (isBuilding): 
		scene = BUILD.instantiate() 
		print("build")
	else: 
		scene = WALK.instantiate()
		print("walk")
	add_child(scene)

func _process(delta: float) -> void:
	pass
