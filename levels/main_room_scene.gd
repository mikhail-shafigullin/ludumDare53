extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if State.location == State.LocationState.STATE_HALLWAY:
		State.player.transform = $Marker_fromHallway.transform
	elif State.location == State.LocationState.STATE_BALCONY:
		State.player.transform = $Marker_fromBalcony.transform
	else:
		State.player.transform = get_node('StartMarker').transform
	
	if State.day == 1 && State.transitionEventKey == '2dayStart' :
		startSecondDay();
	
	State.location = State.LocationState.STATE_MAIN_ROOM;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func on_bed_day1():
	if State.dayScripts.firstDay.wentToKitchen && !State.dayScripts.firstDay.goToSleep:
		State.sceneManager.play_dialogue("res://assets/dialogue/1day/night_1day.dialogue");
	else :
		State.sceneManager.play_dialogue("res://assets/dialogue/dontWantSleep.dialogue")

func startSecondDay():
	print('Second day start')
	State.player_is_busy = true
	State.day = 2
	State.dayScripts.secondDay.beginOfDay = true;
	State.sceneManager.play_dialogue("res://assets/dialogue/2day/beginOfDay_day2.dialogue");

func _on_door_to_the_hallway_object_used():
	State.sceneManager.transtionTo("res://levels/hallway_scene.tscn");
	print('Go to the hallway');
	

func _on_door_to_the_balcony_object_used():
	State.sceneManager.transtionTo("res://levels/balcony_scene.tscn");
	print('Go to the balcony');


func _on_bed_object_used():
	match State.day :
		1:
			on_bed_day1();
		_:
			State.sceneManager.play_dialogue("res://assets/dialogue/dontWantSleep.dialogue");
	
	pass # Replace with function body.

