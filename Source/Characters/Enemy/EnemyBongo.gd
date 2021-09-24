extends KinematicBody2D

const BULLET: = preload("res://Source/Objects/EnemyBullet.tscn")

onready var bullet_timer: Timer = $BulletTimer

func _on_Area2D_body_entered(body: Node) -> void:
	Global.score += 1
	queue_free()

func _on_Timer_timeout() -> void:
	move_and_collide(Vector2(0, 100))

func _on_BulletTimer_timeout() -> void:
	var bullet = BULLET.instance()
	bullet.position = position
	add_child(bullet)
