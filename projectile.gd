extends CharacterBody2D

@export var SPEED = 100

@export var direction: float
var SpawnPos: Vector2
var SpawnRot: float
var Zdex: int

func _Ready():
	global_position = SpawnPos
	global_rotation = SpawnRot
	z_index = Zdex
func _physics_process(_delta: float):
		velocity = Vector2(SPEED,0).rotated(direction)
		move_and_slide()


func _on_hit_box_body_entered(body: Node2D) -> void:
	print("HIT!!")
	queue_free()
