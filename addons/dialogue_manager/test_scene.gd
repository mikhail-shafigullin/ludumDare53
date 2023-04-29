class_name BaseDialogueTestScene extends Node2D

const Balloon = preload("res://assets/dialogue/ballon/balloon.tscn")

const DialogueSettings = preload("res://addons/dialogue_manager/components/settings.gd")


@onready var title: String = DialogueSettings.get_user_value("run_title")
@onready var resource: DialogueResource = load(DialogueSettings.get_user_value("run_resource_path"))


func _ready():
	var screen_index: int = DisplayServer.get_primary_screen()
	DisplayServer.window_set_position(Vector2(DisplayServer.screen_get_position(screen_index)) + (DisplayServer.screen_get_size(screen_index) - DisplayServer.window_get_size()) * 0.5)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
	
	if State.player_is_busy:
		return
	
	State.player_is_busy = true
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(resource, "start")
	balloon.tree_exiting.connect(func(): State.player_is_busy = false)

func _enter_tree() -> void:
	DialogueSettings.set_user_value("is_running_test_scene", false)


### Signals


func _on_dialogue_ended(_resource: DialogueResource):
	get_tree().quit()
