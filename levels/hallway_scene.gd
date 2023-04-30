extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	State.location = State.LocationState.STATE_MAIN_ROOM;
	if State.location == State.LocationState.STATE_MAIN_ROOM:
		State.player.transform = $Marker_fromMainRoom.transform
	else:
		State.player.transform = $Marker_fromEntrance.transform
		
	State.location = State.LocationState.STATE_KITCHEN;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_to_the_main_room_object_used():
	State.sceneManager.transtionTo("res://levels/main_room_scene.tscn");
	print('Go to the main room');


func _on_door_to_the_entrance_object_used():
	print('Go to the intrance');


func _on_door_to_the_kitchen_object_used():
	print('Go to the kitchen');
