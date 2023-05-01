extends Node2D
@onready var ihud = $interactiveHud

var transitionScenePath: String;
signal transition

const Balloon = preload("res://assets/dialogue/ballon/balloon.tscn")
var has_balloon := false

# Called when the node enters the scene tree for the first time.
func _ready():
	State.sceneManager = self
	State.soundBoard = $SoundBoard;
	new_day()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func new_day():

	startFirstDay();
	
	if State.day == 6:
		start_last_day()

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

func start_last_day():
	if State.day == 6 && !State.dayScripts.lastDay.beginOfDay:
		playDialogueComputer_DayLast()
	
func playDialogueComputer_DayOne():
	State.sceneManager.play_dialogue("res://assets/dialogue/1day/beginOfDay.dialogue");
	State.dayScripts.firstDay.beginOfDay = true;

func playDialogueComputer_DayLast():
	State.sceneManager.play_dialogue("res://assets/dialogue/6day/dayBegin.dialogue");
	State.dayScripts.lastDay.beginOfDay = true;

func _on_dialog_end() -> void:
	State.sceneManager.ihud.novel_hide()
	has_balloon = false
	State.player_is_busy = false
