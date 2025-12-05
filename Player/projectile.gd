extends CharacterBody2D

@export var Speed = 900

@export var direction: float
var SpawnPos: Vector2
var SpawnRot: float
var Zdex: int

func _Ready():
	global_position = SpawnPos
	global_rotation = SpawnRot
	z_index = Zdex
func _physics_process(_delta: float):
		velocity = Vector2(Speed,0).rotated(direction)
		move_and_slide()


func _on_hit_box_body_entered(_body: Node2D) -> void:
	if _body.is_in_group("Enemy") or is_in_group("Boss"):
		_body.Take_Damage(1)
		queue_free()
	else:
		print("HIT!!")
		queue_free()
