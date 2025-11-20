extends State
@export var Player : CharacterBody2D
@export var JUMP_VELOCITY = -600.0

func enter() -> void:
	player.velocity.y = JUMP_VELOCITY
	
func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	if Player.is_on_floor():
		transitioned.emit("idle")

func physics_update(_delta: float) -> void:
	pass
