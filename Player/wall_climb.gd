extends State
@export var player : CharacterBody2D

func enter() -> void:
	pass
	
func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		transitioned.emit("Jump")

func physics_update(_delta: float) -> void:
	pass
