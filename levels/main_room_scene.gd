extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	State.player.transform = $Marker2D.transform
	State.player.move_to_front();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_to_the_hallway_object_used():
	print('Go to the hallway');
	


func _on_door_to_the_balcony_object_used():
	print('Go to the balcony');
