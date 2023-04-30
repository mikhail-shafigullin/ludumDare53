extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	State.player.global_transform = $Marker2D.global_transform




func _on_area_2d_body_entered(body):
	if body == State.player:
		State.player.get_node("AnimationPlayer").play("idle_90")


func _on_usable_object_object_used():
	$UsableObject.play_dialogue("res://assets/dialogue/test.dialogue")
