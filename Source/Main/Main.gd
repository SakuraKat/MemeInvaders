extends Node2D

onready var player: KinematicBody2D = $Player
onready var player_bullet_timer: Timer = $PlayerBulletTimer

const BULLET: = preload("res://Source/Objects/PlayerBullet.tscn")

export var max_speed: int = 32000
export var bullet_fire_rate_per_second: float = 3
export var wave_time: int = 6

const WAVES: = [
		preload("res://Source/waves/wave1.tscn"), 
		preload("res://Source/waves/wave2.tscn"), 
		preload("res://Source/waves/wave3.tscn"), 
		preload("res://Source/waves/wave4.tscn"), 
		preload("res://Source/waves/wave5.tscn")
	]

func calculate_direction() -> Vector2:
	var direction : Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
	return direction

func calculate_velocity() -> Vector2:
	var out : Vector2 = Vector2()
	
	out = calculate_direction() * max_speed
	
	return out

func shoot_bullet():
	if player_bullet_timer.time_left != 0:
		return
	var bullet = BULLET.instance()
	bullet.position = player.position
	bullet.position.y -= 56
	add_child(bullet)
	player_bullet_timer.start()

func _physics_process(delta: float) -> void:
	var velocity = calculate_velocity()
# warning-ignore:return_value_discarded
	player.move_and_slide(velocity * delta)

func _ready() -> void:
	Global.score = 0
	player_bullet_timer.wait_time = 1.0/bullet_fire_rate_per_second

func _input(_event: InputEvent) -> void:
	if Input.is_action_pressed("shoot"):
		shoot_bullet()


func _on_WaveTimer_timeout() -> void:
	var wave = WAVES[int(rand_range(0, WAVES.size() + 1))].instance()
	add_child(wave)
