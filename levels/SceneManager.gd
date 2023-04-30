extends Node2D
@onready var ihud = $interactiveHud

var transitionScenePath: String;

# Called when the node enters the scene tree for the first time.
func _ready():
	State.sceneManager = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func transtionTo(sceneFilePath: String):
	transitionScenePath = sceneFilePath;
	State.player_is_busy = true;
	$TransitionScreen.transition();

func _on_transition_screen_transitioned():
	$CurrentScene.get_child(0).queue_free();
	var scene = load(transitionScenePath).instantiate();
	$CurrentScene.add_child(scene);
	State.player_is_busy = false;
