extends State
@export var Player : CharacterBody2D

@export var jump_force := Vector2(250, -450)

func enter() -> void:
	var p = Player

	var normal: Vector2 = p.get_wall_normal_only()
	if normal == Vector2.ZERO:
		return   # not on a wall

	var dir := 1
	if normal.x < 0:
		dir = -1

	p.velocity.x = dir * jump_force.x
	p.velocity.y = jump_force.y


func exit() -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	var p = Player
	p.velocity.y += p.gravity * _delta
	p.move_and_slide()
