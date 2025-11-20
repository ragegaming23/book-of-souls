extends State
@export var Player : CharacterBody2D
@export var JUMP_VELOCITY = -500.0

func enter() -> void:
	Player.velocity.y = JUMP_VELOCITY
	
func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and Player.CanDoubleJump:
		transitioned.emit("Double Jump")
	
	#if Player.CanWallClimb and player.onWall:
		#transitioned.emit("WallClimb")
	
	if Input.is_action_just_pressed("Dash") and Player.CanDash:
		transitioned.emit("Dash")
	
	if Player.is_on_floor():
		transitioned.emit("idle")
	
func physics_update(_delta: float) -> void:
	pass
