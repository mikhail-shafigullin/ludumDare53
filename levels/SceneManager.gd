extends Node2D
@onready var ihud = $interactiveHud
@onready var night = $Night
@onready var debug_menu = $debugMenu
@onready var after_dialog_timer = $AfterDialogTimeout

var transitionScenePath: String;
signal transition

const Balloon = preload("res://assets/dialogue/ballon/balloon.tscn")
var has_balloon := false

# Called when the node enters the scene tree for the first time.
func _ready():
	State.sceneManager = self
	State.soundBoard = $SoundBoard;
	State.soundBoard.playNonPositionalSound("ePiano");
	new_day();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func new_day():

	startFirstDay();

func set_day(day_state: bool):
	night.visible = !day_state
	State.room_light = !day_state

func transtionTo(sceneFilePath: String):
	transitionScenePath = sceneFilePath;
	State.player_is_busy = true;
	$TransitionScreen.transition();
	transition.emit()
	
func transtionToWithEvent(sceneFilePath: String, eventKey: String):
	transitionScenePath = sceneFilePath;
	State.player_is_busy = true;
	State.transitionEventKey = eventKey;
	$TransitionScreen.transition();
	transition.emit()

func _on_transition_screen_transitioned():
	if transitionScenePath == "":
		return
	$CurrentScene.get_child(0).queue_free();
	var scene = load(transitionScenePath).instantiate();
	$CurrentScene.add_child(scene);
	if !has_balloon:
		State.player_is_busy = false;

func play_dialogue(path_to_dialogue: String):

	State.player_is_busy = true
	
	var balloon: Node = Balloon.instantiate()
	$CurrentScene.add_child(balloon)
	has_balloon = true
	var dialogue = load(path_to_dialogue)
	balloon.start(dialogue, "start")
	balloon.tree_exiting.connect(_on_dialog_end)
	
func startFirstDay():
	if State.day == 1 && !State.dayScripts.firstDay.beginOfDay:
		print("Start script for begin of the day");
		playDialogueComputer_DayOne();

	
func playDialogueComputer_DayOne():
	State.sceneManager.play_dialogue("res://assets/dialogue/1day/beginOfDay.dialogue");
	State.dayScripts.firstDay.beginOfDay = true;

func _on_dialog_end() -> void:
	State.sceneManager.ihud.novel_hide()
	has_balloon = false
	State.player_is_busy = false
	State.player_can_use = false
	after_dialog_timer.start();

func restart_day() -> void:
	match State.day:
		1:
			debug_menu.teleportTo1Day()
		2:
			debug_menu.teleportTo2Day()
		3:
			debug_menu.teleportTo3Day()
		4:
			debug_menu.teleportTo4Day()
		5:
			debug_menu.teleportTo5Day()
		6:
			debug_menu.teleportTo6Day()


func _on_after_dialog_timeout_timeout():
	State.player_can_use = true


func _on_bosy_timer_timeout():
	var ballon = $CurrentScene.get_child_count() > 1
	if ballon:
		State.player_is_busy = true
	else:
		State.player_is_busy = false
