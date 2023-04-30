extends Node

enum LocationState {
	STATE_MAIN_ROOM, 
	STATE_HALLWAY, 
	STATE_KITCHEN, 
	STATE_LONG_ROOM,
	STATE_DEBUG
}

var player_is_busy := false
var player: Node2D;
var location: LocationState;
var sceneManager: Node2D;
var day: int = 0;
