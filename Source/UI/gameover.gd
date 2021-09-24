extends Control

func _ready() -> void:
	$ScoreLabel.text = $ScoreLabel.text % Global.score
