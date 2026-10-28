extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var sprite_seed = Global.charaterSeed;
	if (sprite_seed % 2 == 0): texture = load("res://resource/Persian.png");
	else: texture = load("res://resource/Egyptian.png");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
