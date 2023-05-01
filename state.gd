extends Node

enum LocationState {
	STATE_MAIN_ROOM, 
	STATE_HALLWAY, 
	STATE_KITCHEN, 
	STATE_LONG_ROOM,
	STATE_BALCONY, 
	STATE_DEBUG
}

var player_is_busy := false
var player: Node2D;
var location: LocationState;
var sceneManager: Node2D;
var ihud: CanvasLayer;
var day: int = 1;
var soundBoard: Node2D;
var transitionEventKey: String;

var dayScripts := {
	"firstDay": {
		"beginOfDay": false,
		"peephole": false,
		"wentToKitchen": false,
		"goToSleep": false,
	},
	"secondDay": {
		"beginOfDay": false,
		"peephole": false,
		"meetWithWoman": false,
	},
	"lastDay": {
		"beginOfDay": false,
		"letterTaken": false,
	},
};

var dayScripts_DEFAULT := {
	"firstDay": {
		"beginOfDay": false,
		"peephole": false,
		"wentToKitchen": false,
		"goToSleep": false,
	},
	"secondDay": {
		"beginOfDay": false,
		"peephole": false,
		"meetWithWoman": false,
	},
	"lastDay": {
		"beginOfDay": false,
		"letterTaken": false,
	},
};


