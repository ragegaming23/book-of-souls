extends Area2D





# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.CanDash = true
		$Icon.set_visible(false)
		$"unlocked text".set_visible(true)
		await get_tree().create_timer(10).timeout
		queue_free()
