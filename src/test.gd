extends Node2D

const LARGE = preload("res://scene/blocks/large.tscn") # 128px Width
const MEDIUM = preload("res://scene/blocks/medium.tscn") # 64px Width
const SMALL = preload("res://scene/blocks/small.tscn") # 32 px Width


@export var speed: float = 200.0
@export var boundary_x: float = 300.0

var current_block: RigidBody2D = null
var direction: int = 1
var camera_target_y: float = 0.0

@onready var camera: Camera2D = $Camera2D

func _ready() -> void:
	spawn_next_block()
	
	randomize();

func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("GD_SPACE")):
		drop_current_block()
	else:
		move_preview_block(delta)

# funcion that returns current block according to Global.CUR_LEVEL
func get_block_instance() -> RigidBody2D:
	var cur_level = Global.CUR_LEVEL
	if (cur_level == 2): return LARGE.instantiate();
	elif (cur_level == 1): return MEDIUM.instantiate();
	else: return SMALL.instantiate();
		
func spawn_next_block() -> void:
	current_block = get_block_instance()
	Global.CallCount += 1  # Add to CallCount counter so global.gd can keep track of current level calls
	
	# Freeze the current block so it wont fall
	current_block.freeze = true 
	current_block.freeze_mode = RigidBody2D.FREEZE_MODE_KINEMATIC
	
	# Move to camera level and spawns at a random x 
	current_block.position = Vector2(randi_range(-300, 300), camera_target_y)
	add_child(current_block)

# Moves the block while not pressed space
func move_preview_block(delta: float) -> void:
	# Checks if current  Block exists so not freed etc...
	if (!is_instance_valid(current_block)): return
	
	current_block.position.x += direction * speed * delta
	
	# Flips direction by timing the position by negative one or one
	if (current_block.position.x >= boundary_x):
		current_block.position.x = boundary_x
		direction = -1
	elif (current_block.position.x <= -boundary_x):
		current_block.position.x = -boundary_x
		direction = 1

## Drops the block into the physics world and prepares the next one
func drop_current_block() -> void:
	if (!is_instance_valid(current_block)): return
	
	# Unfreeze to let gravity take over
	current_block.freeze = false
	
	# Move the spawning line and camera up for the next block
	camera_target_y -= 64;
	
	camera.position.y = camera_target_y
	
	# Spawn the next block now that the old one is falling
	spawn_next_block()
