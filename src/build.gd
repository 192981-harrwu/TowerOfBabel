extends Node2D
@onready var small = preload("res://scene/blocks/small.tscn")
@onready var medium = preload("res://scene/blocks/medium.tscn")
@onready var large = preload("res://scene/blocks/large.tscn")
@onready var centerLine = preload("res://scene/center_line.tscn")
@onready var camera: Camera2D = $"Camera2D";

var level_ = 0; # store current level 
var global_y = 0; # value to store the current  middle y position so we can update the camera position and others like the middle link sprite
var global_mid = Vector2(0, 0); # value  to store the global mid updates in the update block function
var block_; # value to store the object of the current block
var direction_ = 1 # value to change the moving direction of the block
var delta_; # store delta so we dont need to pass it to eveery function that we need
var curLevelCount = 0;
var start = true; # used once at the start so 


# LARGE MID = 64 LARGE WHOLE = 128
# MEDIUM MID = 32 MEDIUM WHOLE = 64
# SMALL MID = 16 SMALL WHOLE = 16

var center_;

func checkBlockPosValid(posX):
	if (posX <= -10 || posX >= 10):
		print("No good");

func move_block_down():
	var passPos = 0;
	if (level_ == 0): passPos = 32;
	elif (level_ == 1): passPos = 32;
	elif (level_ == 2): passPos = 128;
	else: print ("Error Unkown block type: ", block_);
	global_y -= passPos;
	Game._update_blockCounot();
	
func update_block():
	'''
		in this function we will upda
	'''
	if (level_ == 0): block_ = medium.instantiate(); move_block_down();
	elif (level_ == 1): block_ = small.instantiate(); move_block_down();
	elif (level_ == 2): block_ = large.instantiate(); move_block_down();
	else: print("e")
	
	var seed =  RandomNumberGenerator.new()
	seed.randomize()
	
	block_.position = Vector2(seed.randi_range(-300, 300), global_y); # sets block at random pos if starts in center each time it will be to easy
	camera.position = Vector2(0, global_y);
	center_.position = Vector2(0, global_y);
	add_child(block_);
	direction_ = 1

 
func _ready() -> void:
	center_ = centerLine.instantiate();
	center_.position = Vector2(0, global_y);
	add_child(center_);
	

func _process(delta: float) -> void:
	delta_ = delta
	level_ = Game.GLOBAL_LVL_;
	if (start): update_block(); start = false;
	if (!Input.is_action_just_pressed("GD_SPACE")): 
		if (block_.position.x > 300): direction_ = -1;
		elif (block_.position.x < -300): direction_ = 1;
		block_.position.x += 50 * delta * direction_;
	else: 
		checkBlockPosValid(block_.position.x);
		update_block();
		
