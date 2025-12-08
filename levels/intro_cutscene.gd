extends Node2D

func _ready():
	$FadeTransition/Timer.start()
	$FadeTransition/AnimationPlayer.play("Fade_out")

func _on_timer_timeout():
	$AnimationPlayer.play("Camera_pan")
	await $AnimationPlayer.animation_finished




func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$FadeTransition/Timer2.start()
	$FadeTransition/AnimationPlayer.play("Fade_in")

func _on_timer_2_timeout() -> void:
	get_tree().change_scene_to_file("res://levels/Library_Level Hub/level_1_tutorial.tscn")
