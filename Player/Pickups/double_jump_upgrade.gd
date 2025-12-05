extends Area2D


# Called when the node enters the scene tree for the first time.


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.CanDoubleJump = true
		$Icon.set_visible(false)
		$"unlocked text".set_visible(true)
		await get_tree().create_timer(10).timeout
		queue_free()
