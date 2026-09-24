extends Sprite2D

var time_passed: float = 0.0

func change_texture(idx: int):
	if (idx % 2 == 0): texture = load("res://resource/background1.png")
	else: texture = load("res://resource/background 2.png")

func _ready() -> void:
	randomize()
	change_texture(randi_range(0, 100));

func _process(delta: float) -> void:
	time_passed += delta
	if time_passed >= randf_range(0.5, 5.0):
		time_passed = 0.0 # Reset the tracker
		change_texture(randi_range(0, 100))
