extends Area2D

static var velocity = 10
@onready var laser_prefab = preload("res://scenes/laser.tscn")
@onready var explosion = preload("res://scenes/explosion.tscn")
@onready var parent_node = get_parent()

func _ready() -> void:
	position.x = -800
	position.y = 100
	


func _process(delta: float) -> void:
	if (Input.is_action_pressed("_SPC_GD")):
		var laser_ = laser_prefab.instantiate()	
		get_parent().add_child(laser_)
		laser_.position = position
		laser_.position.x = position.x + 45;
	if (Input.is_action_pressed("_UP_GD") && position.y > -200):
		position.y -= velocity
	if (Input.is_action_pressed("_DN_GD") && position.y < 200):
		position.y += velocity

func _on_area_entered(area: Area2D) -> void:
	if (area is e_laser):
		var explosion_ = explosion.instantiate()
		explosion_.position = area.getPos()
		get_parent().add_child(explosion_)
		area.queue_free()
		var parent_value = parent_node.getScore()
		print("E: ", parent_value)
		get_tree().paused = true;
		await get_tree().create_timer(2.5).timeout
		queue_free()
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")
		
