extends GPUParticles2D

#@onready var particles: GPUParticles2D = $GPUParticles2D
#@export var isFinnished: bool = false

func _ready() -> void:
	self.amount = 1000
	self.one_shot = true
	self.emitting = true
	var mat = self.process_material as ParticleProcessMaterial
	if mat:
		mat.spread = 360
		mat.initial_velocity_min = 10
		mat.initial_velocity_max = 100
		mat.angular_velocity_max = 90
		mat.angular_velocity_min = -90
