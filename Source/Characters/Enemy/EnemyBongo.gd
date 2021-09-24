extends KinematicBody2D

const game_over_screen_path: = "res://Source/UI/gameover.tscn"
const BULLET: = preload("res://Source/Objects/EnemyBullet.tscn")

onready var bullet_timer: Timer = $BulletTimer
onready var visibility_notifier: VisibilityNotifier2D = $VisibilityNotifier2D

func _on_Area2D_body_entered(_body: Node) -> void:
	Global.score += 1
	visibility_notifier.disconnect("screen_exited", $".", "_on_VisibilityNotifier2D_screen_exited")
	queue_free()

func _on_Timer_timeout() -> void:
# warning-ignore:return_value_discarded
	move_and_collide(Vector2(0, 100))

func _on_BulletTimer_timeout() -> void:
	var bullet = BULLET.instance()
	bullet.position = position
	add_child(bullet)

func _on_VisibilityNotifier2D_screen_exited() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene(game_over_screen_path)
