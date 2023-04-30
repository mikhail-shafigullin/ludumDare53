extends Node2D
@onready var ihud = $interactiveHud

var transitionScenePath: String;
signal transition

const Balloon = preload("res://assets/dialogue/ballon/balloon.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	State.sceneManager = self
	State.soundBoard = $SoundBoard;
	
	if State.day == 1 && !State.dayScripts.firstDay.beginOfDay:
		print("Start script for begin of the day");
		playDialogueComputer_DayOne();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func transtionTo(sceneFilePath: String):
	transitionScenePath = sceneFilePath;
	State.player_is_busy = true;
	$TransitionScreen.transition();
	transition.emit()

func _on_transition_screen_transitioned():
	$CurrentScene.get_child(0).queue_free();
	var scene = load(transitionScenePath).instantiate();
	$CurrentScene.add_child(scene);
	State.player_is_busy = false;

func play_dialogue(path_to_dialogue: String):
	if State.player_is_busy:
		return
		
	State.player_is_busy = true
	
	var balloon: Node = Balloon.instantiate()
	$CurrentScene.get_child(0).add_child(balloon)
	balloon.start(load(path_to_dialogue), "start")
	balloon.tree_exiting.connect(_on_dialog_end)
	
func playDialogueComputer_DayOne():
	State.sceneManager.play_dialogue("res://assets/dialogue/1day/beginOfDay.dialogue");
	State.dayScripts.firstDay.beginOfDay = true;

func _on_dialog_end() -> void:
	State.player_is_busy = false
