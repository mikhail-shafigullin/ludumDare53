extends Node

enum LocationState {STATE_MAIN_ROOM, STATE_HALLWAY, STATE_KITCHEN}

var player_is_busy := false
var player: Node2D;
var location: LocationState;

