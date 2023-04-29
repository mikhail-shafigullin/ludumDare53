extends Control
@onready var exit_button = $VBoxContainer/Exit
@onready var test_button = $VBoxContainer/Test


# Called when the node enters the scene tree for the first time.
func _ready():
	exit_button.pressed.connect(func(): get_tree().quit())
	test_button.pressed.connect(nn_test)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func nn_test():
	var nn_scene = load("res://test/nn_test.tscn").instantiate()
	get_tree().get_root().add_child(nn_scene)
	
	queue_free()


func _on_gameplay_test_pressed():
	var nn_scene = load("res://altTest/gameplay_test_scene.tscn").instantiate()
	get_tree().get_root().add_child(nn_scene)
	
	queue_free()
