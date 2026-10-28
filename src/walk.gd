extends Node2D

const LARGE = preload("res://scene/platform/Large.tscn") # 128px Width
const MEDIUM = preload("res://scene/platform/Medium.tscn") # 64px Width
const SMALL = preload("res://scene/platform/Small.tscn") # 32 px Width

var objectPlatform;

func _ready() -> void:	
	var passLevel = Global.CUR_LEVEL
	if (passLevel == 2): objectPlatform = LARGE.instantiate();	
	elif (passLevel == 1): objectPlatform = MEDIUM.instantiate();
	else: objectPlatform = SMALL.instantiate();
	objectPlatform.z_index = -100;
	add_child(objectPlatform);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
