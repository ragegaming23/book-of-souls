extends CharacterBody2D

class_name BioBitter
const speed = 100

var is_BioBitter_chase: bool

var health = 3
var health_max = 3
var health_min = 0

var dead: bool = false
var taking_damage: bool = false
var damage_to_deal = 1
var is_dealing_damage: bool = false

var dir: Vector2
const gravity = 900
var knockback_force = 200
var is_roaming: bool = true

var player: CharacterBody2D
var player_in_area = false

func _process(delta):
	if !is_on_floor():
		velocity.y += gravity * delta
		velocity.x = 0
	move(delta)
	move_and_slide()
	
func move(delta):
	if !dead:
		if !is_BioBitter_chase:
			velocity += dir * speed * delta
		elif is_BioBitter_chase and !taking_damage:
			var dir_to_player = position.direction_to(player.position) * speed
			velocity.x = dir_to_player.x
		is_roaming = true
	elif dead:
		velocity.x = 0

func handle_death():
	self.queue_free()

func _on_direction_timer_timeout() -> void:
	$DirectionTimer.wait_time = choose([1.5,2.0,2.5])
	if !is_BioBitter_chase:
		dir = choose([Vector2.RIGHT, Vector2.LEFT])
		velocity.x = 0

func choose(array):
	array.shuffle()
	return array.front()

func Take_Damage(dmg: int):
	health = max(health - dmg, 0)

func _on_hitbox_body_entered(body: Node2D) -> void:
	Take_Damage(1)

func death():
	if health == 0:
		dead = true
		queue_free()
