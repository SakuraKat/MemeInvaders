extends KinematicBody2D

const game_over_screen_path: = "res://Source/UI/gameover.tscn"

func _on_Area2D_body_entered(body: Node) -> void:
	get_tree().change_scene(game_over_screen_path)
