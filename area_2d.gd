extends Area2D





# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.CanDash = true
		queue_free()


func _on_animation_timeout() -> void:
	$Icon.set_visible(true)
	$Icon2.set_visible(false)
	await get_tree().create_timer(3).timeout
	$Icon.set_visible(false)
	$Icon2.set_visible(true)
