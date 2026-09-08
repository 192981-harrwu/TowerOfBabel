extends Node2D

@onready var enemy_prefab = preload("res://scenes/enemy.tscn")

var score = 0 

@onready var player = $player

func getScore(): return score;

func _ready() -> void:
	pass

func _process(deta: float) -> void:
	_update_ui();

func _on_enemytimer_timeout() -> void:
	var enemy = enemy_prefab.instantiate()
	var random_y = randi_range(-200, 200)
	enemy.position = Vector2(0, random_y)
	enemy.enemy_killed.connect(_on_enemykilled)
	add_child(enemy)
	
func _on_enemykilled():
	score += 500
	_update_ui()

func _update_ui():
	$game_ui/score_label.text = "Score: " + str(score);
