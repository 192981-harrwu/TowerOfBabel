extends Node2D

const SMALL = preload("res://scene/blocks/small.tscn")
const MEDIUM = preload("res://scene/blocks/medium.tscn")
const LARGE = preload("res://scene/blocks/large.tscn")

@onready var camera: Camera2D = $Camera2D

var block_: RigidBody2D = null
var direction: float = 1.0
var level_: int = 0
var speed: float = 300.0
var glob_pos: Vector2 = Vector2(0, 0)

func _ready() -> void:
	spawn_new_block() 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("GD_SPACE"): 
		drop_current_block()
		spawn_new_block()

func _physics_process(delta: float) -> void:
	if block_ != null:
		block_.position.x += direction * delta * speed
		if block_.position.x >= 300:
			block_.position.x = 300
			direction = -1.0
		elif block_.position.x <= -300:
			block_.position.x = -300
			direction = 1.0

func spawn_new_block() -> void:
	if level_ == 0:
		block_ = LARGE.instantiate()
		level_ = 1
	elif level_ == 1:
		block_ = MEDIUM.instantiate()
		level_ = 2
	elif level_ == 2:
		block_ = SMALL.instantiate()
		level_ = 0

	block_.freeze = true
	block_.freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
	block_.position = Vector2(randf_range(-300, 300), glob_pos.y)
	add_child(block_)

func drop_current_block() -> void:
	if block_ != null:
		block_.freeze = false 
		glob_pos.y -= 25
		camera.position.y -= 25
