extends Area2D





func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.CanWallClimb = true
		$Icon.set_visible(false)
		$"unlocked text".set_visible(true)
		await get_tree().create_timer(10).timeout
		queue_free()
