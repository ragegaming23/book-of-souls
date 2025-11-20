extends State
@export var Player : CharacterBody2D
@export var JUMP_VELOCITY = -600.0

func enter() -> void:
	Player.velocity.y = JUMP_VELOCITY
	
func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	if Player.is_on_floor():
		transitioned.emit("idle")
	
	if Input.is_action_just_pressed("Dash") and Player.CanDash:
		transitioned.emit("Dash")
func physics_update(_delta: float) -> void:
	pass
