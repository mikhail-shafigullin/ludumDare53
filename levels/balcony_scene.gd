extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if State.location == State.LocationState.STATE_MAIN_ROOM:
		State.player.transform = $Marker_fromMainRoom.transform
	elif State.location == State.LocationState.STATE_KITCHEN:
		State.player.transform = $Marker_fromKitchen.transform
	else:
		State.player.transform = $Marker_fromMainRoom.transform
		
	State.location = State.LocationState.STATE_BALCONY;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_to_main_room_object_used():
	State.sceneManager.transtionTo("res://levels/main_room_scene.tscn");
	print('Go to the main room');


func _on_door_to_kitchen_object_used():
	State.sceneManager.transtionTo("res://levels/kitchen_scene.tscn");
	print('Go to the kitchen');
