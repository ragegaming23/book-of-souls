extends State
@export var Player : CharacterBody2D

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and Player.is_on_floor():
		transitioned.emit("Jump")
	if Input.is_action_just_pressed("Dash") and Player.CanDash:
		transitioned.emit("Dash")

func physics_update(_delta: float) -> void:
	pass
