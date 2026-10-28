extends Node


var CUR_LEVEL: int = 2 # 2 = Large, 1 = Medium, 0 = Small

var charaterSeed: int; # Variable that determines player character for walk level if even we use we will determine value in load.gd

var CallCount: int = 0: # usedd to determine when to change cur level
	set(value):
		CallCount = value
		update_level()

func update_level() -> void:
	if CallCount == 0: 
		return
	if CallCount % 5 == 0:
		CUR_LEVEL -= 1
		CUR_LEVEL = max(CUR_LEVEL, 0)
