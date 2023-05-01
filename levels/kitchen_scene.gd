extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if State.transitionEventKey == 'fromPeepholeDayOne':
		State.player.transform = $Marker_trashCan.transform;
		State.player_is_busy = false;
		State.sceneManager.play_dialogue("res://assets/dialogue/1day/trashCan_1day.dialogue");
		State.transitionEventKey = '';
	elif State.location == State.LocationState.STATE_HALLWAY:
		State.player.transform = $Marker_fromHallway.transform
	elif State.location == State.LocationState.STATE_BALCONY:
		State.player.transform = $Marker_fromBalcony.transform
	else:
		State.player.transform = $Marker_trashCan.transform
	
	State.location = State.LocationState.STATE_KITCHEN;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_trash_can_object_used():
	pass # Replace with function body.

func _on_door_to_the_balcony_object_used():
	State.sceneManager.transtionTo("res://levels/balcony_scene.tscn");

func _on_door_to_the_hallway_object_used():
	State.sceneManager.transtionTo("res://levels/hallway_scene.tscn");
