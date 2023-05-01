extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if State.location == State.LocationState.STATE_HALLWAY:
		State.player.transform = get_node('Marker_fromHallway').transform
	if State.location == State.LocationState.STATE_BALCONY:
		State.player.transform = $Marker_fromBalcony.transform
	else:
		State.player.transform = get_node('StartMarker').transform
	
	State.location = State.LocationState.STATE_MAIN_ROOM;
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_door_to_the_hallway_object_used():
	State.sceneManager.transtionTo("res://levels/hallway_scene.tscn");
	print('Go to the hallway');
	

func _on_door_to_the_balcony_object_used():
	State.sceneManager.transtionTo("res://levels/balcony_scene.tscn");
	print('Go to the balcony');
