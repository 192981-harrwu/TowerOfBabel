extends Area2D

@onready var explosion = preload("res://scenes/explosion.tscn")
@onready var laser_e = preload("res://scenes/enemy_laser.tscn")
signal enemy_killed

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	position.x -= 250 * delta

func _on_area_entered(area: Area2D) -> void:
	if (area is laser):
		var explosion_ = explosion.instantiate()
		explosion_.position = position 
		get_parent().add_child(explosion_)
		queue_free()
		area.queue_free()
		enemy_killed.emit();
		
func _on_timer_timeout() -> void:
	var laser_ = laser_e.instantiate()
	laser_.position = position
	get_parent().add_child(laser_)
	
