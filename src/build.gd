extends Node2D

const SMALL = preload("res://scene/blocks/small.tscn")
const MEDIUM = preload("res://scene/blocks/medium.tscn")
const LARGE = preload("res://scene/blocks/large.tscn")

var block_
var direction = 1
var level_ = 0
var speed = 30

func update_block_() -> void:
	await get_tree().create_timer(1.5).timeout
	if level_ == 0:
		block_ = LARGE.instantiate()
		add_child(block_)
		level_ += 1
	elif level_ == 1:
		block_ = MEDIUM.instantiate()
		add_child(block_)
		level_ += 1
	elif level_ == 2:
		block_ = SMALL.instantiate()
		add_child(block_)
		level_ = 0

func _ready() -> void:
	randomize()
	block_ = LARGE.instantiate()
	add_child(block_)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("GD_SPACE"):
		update_block_()
		block_.position.x = randi_range(-300, 300)
		
	block_.position.x += direction * delta * speed
	
	if (block_.position.x >= 300 || block_.position.x <= -300): direction *= -1
