extends Node2D
class_name mainNode

const MAXLEVELCOUNT = 3;

var GLOBAL_LVL_;
var curLevelCount = 0;
var GLOBAL_ISFINNISHED = false;

func _update_blockCounot() -> void:
	print(GLOBAL_LVL_);
	curLevelCount += 1;
	if (curLevelCount == MAXLEVELCOUNT):
		curLevelCount = 0
		if (GLOBAL_LVL_ == 1):
			await get_tree().create_timer(2.5).timeout
			get_tree().change_scene_to_file("res://scene/finnish.tscn")
		GLOBAL_LVL_ += 1;
	if (GLOBAL_LVL_ == 3): GLOBAL_LVL_ = 0
		
	

func _ready() -> void:
	GLOBAL_LVL_ = 2;

func _process(delta: float) -> void:
	pass;
	
