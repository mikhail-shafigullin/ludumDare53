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
		State.player.transform = $Marker_fromEntrance.transform;
		
	checkReadyEvents();
		
	State.location = State.LocationState.STATE_HALLWAY;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_to_the_main_room_object_used():
	if State.day == 6:
		return
	State.sceneManager.transtionTo("res://levels/main_room_scene.tscn");
	print('Go to the main room');


func _on_door_to_the_entrance_object_used():
	peepholeCheck();		
	print('Go to the intrance');


func _on_door_to_the_kitchen_object_used():
	State.sceneManager.transtionTo("res://levels/kitchen_scene.tscn");
	print('Go to the kitchen');


func peepholeCheck():
	match State.day :
		1:
			events_dayOne()
		2: 
			events_daySecond()
		5:
			events_dayFifth()
		6: 
			events_daySix()
		_: 
			State.sceneManager.transtionTo("res://levels/long_room.tscn");
		
func events_dayOne():
	if !State.dayScripts.firstDay.peephole:
		State.sceneManager.play_dialogue("res://assets/dialogue/1day/peephole_1day.dialogue");
		State.dayScripts.firstDay.peephole = true;
	elif !State.dayScripts.firstDay.wentToKitchen:
		State.dayScripts.firstDay.wentToKitchen = true;
		State.sceneManager.transtionToWithEvent("res://levels/kitchen_scene.tscn", "fromPeepholeDayOne")
	else :
		State.sceneManager.transtionTo("res://levels/long_room.tscn");
		
func events_daySecond():
	if State.dayScripts.secondDay.beginOfDay && !State.dayScripts.secondDay.peephole: 
		State.sceneManager.play_dialogue("res://assets/dialogue/2day/peephole_day2.dialogue");
		State.dayScripts.secondDay.peephole = true;
	else :
		State.sceneManager.transtionTo("res://levels/long_room.tscn");

func events_daySix():
	if State.day == 6 && !State.dayScripts.lastDay.secondPhase:
		State.dayScripts.lastDay.secondPhase = true;
		State.player.global_position = Vector2.ZERO
		State.sceneManager.play_dialogue("res://assets/dialogue/6day/day6_door.dialogue")
	else :
		State.sceneManager.transtionTo("res://levels/long_room.tscn");
		
func events_dayFifth():
	if State.day == 5 && !State.dayScripts.fifthDay.peephole:
		State.dayScripts.fifthDay.peephole = true;
		State.sceneManager.play_dialogue("res://assets/dialogue/5day/day5_door.dialogue")
		State.player.global_position = Vector2.ZERO
	else :
		State.sceneManager.transtionTo("res://levels/long_room.tscn");
		
func checkReadyEvents():
	match State.day :
		2: 
			readyEvents_daySecond()
			
func readyEvents_daySecond():
	if State.transitionEventKey == 'afterMetWithWomen':
		State.sceneManager.play_dialogue("res://assets/dialogue/2day/afterMeetingWithWomen_day2.dialogue");
		State.transitionEventKey = '';
