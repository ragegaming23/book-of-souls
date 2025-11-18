extends State
@export var player : CharacterBody2D
@export var JUMP_VELOCITY = -500.0

func enter() -> void:
	player.velocity.y = JUMP_VELOCITY
	
func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and player.CanDoubleJump(true):
		transitioned.emit("Double Jump")
	
	#if player.CanWallClimb(true) and player.onWall(true):
		#transitioned.emit("WallClimb")
	
	if Input.is_action_just_pressed("Dash") and player.CanDash(true):
		transitioned.emit("Dash")
	
	if player.is_on_floor():
		transitioned.emit("idle")
	
func physics_update(_delta: float) -> void:
	pass
