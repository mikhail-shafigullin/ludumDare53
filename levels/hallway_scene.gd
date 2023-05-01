extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if State.location == State.LocationState.STATE_MAIN_ROOM:
		State.player.transform = $Marker_fromMainRoom.transform
	elif State.location == State.LocationState.STATE_KITCHEN:
		State.player.transform = $Marker_fromKitchen.transform
	elif State.location == State.LocationState.STATE_LONG_ROOM:
		State.player.transform = $Marker_fromEntrance.transform
	else:
		State.player.transform = $Marker_fromEntrance.transform
		
	State.location = State.LocationState.STATE_HALLWAY;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_to_the_main_room_object_used():
	State.sceneManager.transtionTo("res://levels/main_room_scene.tscn");
	print('Go to the main room');


func _on_door_to_the_entrance_object_used():
	peepholeCheck();		
	print('Go to the intrance');


func _on_door_to_the_kitchen_object_used():
	State.sceneManager.transtionTo("res://levels/kitchen_scene.tscn");
	print('Go to the kitchen');


func peepholeCheck():
	if State.day == 1 && !State.dayScripts.firstDay.peephole:
		State.sceneManager.play_dialogue("res://assets/dialogue/1day/peephole_1day.dialogue");
		State.dayScripts.firstDay.peephole = true;
		return true;
	else: 
		State.sceneManager.transtionTo("res://levels/long_room.tscn");
