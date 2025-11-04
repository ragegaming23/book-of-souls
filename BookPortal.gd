extends Area2D

@export var next_scene : PackedScene

func load_scene(target_scene: PackedScene):
	get_tree().change_scene_to_packed(target_scene)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().call_group("Player", "death_tween") # death_tween is called here just to give the feeling of player entering the door.
		load_scene(next_scene)
