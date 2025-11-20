extends State
@export var Player : CharacterBody2D


var dash_duration := 0.1
var dash_timer := 0.0

func enter() -> void:
	var direction := Input.get_axis("move_left", "move_right")
	# Determine dash direction
	if direction == 0:
		direction = sign(Player.scale.x)
	
	# Apply dash
	Player.SPEED *= 10
	Player.velocity.x = direction * Player.SPEED

	# Start local timer
	dash_timer = dash_duration

func exit() -> void:
	Player.SPEED = 300

func update(delta: float) -> void:
	# Countdown dash timer
	dash_timer -= delta
	if dash_timer <= 0.0:
		transitioned.emit("idle")
