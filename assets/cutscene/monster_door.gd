extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if State.day == 6:
		$AnimationPlayer.play("peak")
		




func _on_area_2d_body_entered(body):
	if body == State.player:
		if State.day == 6:
			State.player.death()
