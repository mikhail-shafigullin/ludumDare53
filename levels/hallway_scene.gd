extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	State.player.transform = $Marker2D.transform
	State.player.move_to_front();
	State.location = State.LocationState.STATE_MAIN_ROOM;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
