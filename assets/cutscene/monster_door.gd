extends Node2D
var active := false

# Called when the node enters the scene tree for the first time.
func _ready():
	if State.day == 6 && State.dayScripts.lastDay.secondPhase:
		$AnimationPlayer.play("peak")
		active = true




func _on_area_2d_body_entered(body):
	if body == State.player:
		if active:
			State.player.death()
