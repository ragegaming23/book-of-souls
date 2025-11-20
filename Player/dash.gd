extends State
@export var Player : CharacterBody2D


func enter() -> void:
	var dash_timer = Player.get_node("DashTimer")
	# Calculate direction on enter
	Player.direction = Input.get_axis("move_left", "move_right")

	# If no movement input, dash toward facing direction
	if Player.direction == 0:
		Player.direction = sign(Player.scale.x)

	# Increase speed for the dash
	Player.SPEED *= 10

	# Apply dash velocity
	Player.velocity.x = Player.direction * Player.SPEED

	# Start player's dash timer
	dash_timer.start()


func exit() -> void:
	# Reset speed when exiting dash state
	Player.SPEED = 300


func update(_delta: float) -> void:
	# When the dash timer expires, the player script emits a signal you should listen for
	if not Player.dash_timer.is_stopped():
		return

	transitioned.emit("idle")
