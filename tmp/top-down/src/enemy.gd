extends CharacterBody2D

const SPEED = 100.0
@onready var player = get_tree().get_first_node_in_group("player")
@onready var explosion_prefab = preload("res://scenes/gpu_particles_2d.tscn")


func _physics_process(delta: float) -> void:
	var direction = (player.position - position).normalized()
	velocity = direction * SPEED
	var explosion = explosion_prefab.instantiate();
	explosion.position = position 
	get_parent().add_child(explosion)
	move_and_slide()
