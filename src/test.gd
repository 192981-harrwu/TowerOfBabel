extends Node2D
const LARGE = preload("res://scene/blocks/small.tscn")
var block_;
var direction: int = 1;
var speed: float = 100.0;

func _ready() -> void:
	block_ = LARGE.instantiate();
	add_child(block_); 

func _process(delta: float) -> void:
	if (!Input.is_action_just_pressed("GD_SPACE")):
		block_.freeze = true;
		while (!Input.is_action_just_pressed("GD_SPACE")):
			block_.position.x += direction * delta * speed
			if block_.position.x >= 300:
				block_.position.x = 300
				direction = -1.0
			elif block_.position.x <= -300:
				block_.position.x = -300
				direction = 1.0
	else:
		block_.freeze = false;
		await get_tree().create_timer(2.5).timeout
		block_ = LARGE.instantiate();
		add_child(block_); 
		block_.freeze = true;
		block_.freeze_mode = RigidBody2D.FREEZE_MODE_STATIC
		
		
