extends CharacterBody2D

const LARGE = preload("res://scene/platform/Large.tscn") # 128px Width
const MEDIUM = preload("res://scene/platform/Medium.tscn") # 64px Width
const SMALL = preload("res://scene/platform/Small.tscn") # 32 px Width

const SPEED = 300.0
const SPEEDBUFF = -10


func _ready() -> void:
	get_parent().move_child(self, -1) # moves child to top layer
	
func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
	print(self.position);
						
