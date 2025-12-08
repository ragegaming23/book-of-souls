extends Node2D

var button_type = null

func _on_start_pressed() -> void:
	button_type = "start"
	$FadeTransition.show()
	$FadeTransition/Fade_timer.start()
	$FadeTransition/AnimationPlayer.play("Fade_in")


func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()


func _on_fade_timer_timeout():
	if button_type == "start":
		get_tree().change_scene_to_file("res://levels/intro_cutscene.tscn")
