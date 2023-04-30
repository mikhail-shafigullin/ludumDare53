extends Control
@onready var exit_button = $VBoxContainer/Exit

var playerResource = preload("res://characters/player/player.tscn")
var transitionScreen = preload("res://ui/TransitionScreen.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	exit_button.pressed.connect(func(): get_tree().quit())

func _on_gameplay_test_pressed():
	State.player = playerResource.instantiate()
	get_tree().root.add_child(State.player)
	get_tree().change_scene_to_file("res://levels/SceneManager.tscn")

