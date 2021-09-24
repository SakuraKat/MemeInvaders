extends KinematicBody2D

func _physics_process(delta: float) -> void:
	move_and_slide(Vector2(0, -1000))

func _on_Area2D_body_entered(body: Node) -> void:
	queue_free()
