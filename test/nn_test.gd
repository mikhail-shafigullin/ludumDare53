extends Node2D
@onready var player = $Player


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_area_2d_body_entered(body):
	if body == player:
		player.get_node("AnimationPlayer").play("idle_1")
