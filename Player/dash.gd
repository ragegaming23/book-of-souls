extends State
@export var player : CharacterBody2D

func enter() -> void:
	player.Dash()
	
	
func exit() -> void:
	player.SPEED = 300
	
func update(delta: float) -> void:
	if player._on_DashTimer_timeout():
		transitioned.emit("idle")

func physics_update(delta: float) -> void:
	pass
#func _on_DashTimer_timeout() -> void:
	#player.SPEED = 300
