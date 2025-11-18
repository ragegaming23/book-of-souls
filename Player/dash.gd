extends State
@export var player : CharacterBody2D

func enter() -> void:
	player.Dash()
	
	
func exit() -> void:
	pass
	
func update(_delta: float) -> void:
	if player._on_dash_timer_timeout():
		transitioned.emit("idle")

func physics_update(_delta: float) -> void:
	pass
