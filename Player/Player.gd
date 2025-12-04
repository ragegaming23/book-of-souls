extends CharacterBody2D

class_name player

@onready var main = get_tree().get_root().get_node(".")
@onready var projectile = load("res://Player/projectile.tscn")
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -500.0
var flipped = true
@export var CanDoubleJump = false
@export var CanWallClimb = false
@export var onWall = false
@export var CanDash = false
@export var gravity := 1200.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("shoot"):
		shoot()

	# Handle jump.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_pressed("move_left") and flipped:
		scale.x = -1 
		flipped = false
	if Input.is_action_pressed("move_right") and not flipped:
		scale.x = -1
		flipped = true
	
	move_and_slide()
func shoot():
	var instance = projectile.instantiate()
	instance.direction = rotation
	instance.global_position = $BulletSpawn.global_position
	instance.SpawnRot = rotation
	instance.Zdex = z_index -1
	main.add_child.call_deferred(instance)
	
	
#func get_wall_normal_only() -> Vector2:
#	for i in range(get_slide_collision_count()):
#		var collision := get_slide_collision(i)
#		var n := collision.get_normal()

		# TRUE wall = horizontal surface
#		if abs(n.x) > 0.1 and abs(n.y) < 0.1:
#			return n

#	return Vector2.ZERO
