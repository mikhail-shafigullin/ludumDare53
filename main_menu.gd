extends Control
@onready var exit_button = $VBoxContainer/Exit
@onready var test_button = $VBoxContainer/Test


# Called when the node enters the scene tree for the first time.
func _ready():
	exit_button.pressed.connect(func(): get_tree().quit())
	test_button.pressed.connect(nn_test)




func nn_test():
	get_tree().change_scene_to_file("res://test/nn_test.tscn")



func _on_gameplay_test_pressed():
	get_tree().change_scene_to_file("res://altTest/gameplay_test_scene.tscn")

