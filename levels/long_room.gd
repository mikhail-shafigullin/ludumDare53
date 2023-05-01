extends Node2D

@export var margin := 120
@onready var room = $Room

# Called when the node enters the scene tree for the first time.
func _ready():
	State.player.global_transform = $PlayerStart.global_transform


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	var playerTrans = State.player.global_position - global_position - Vector2(600, 0)

	var distance_from_room_enter = int(abs(playerTrans.x))

	if abs(distance_from_room_enter) > margin:
		var offset = int(playerTrans.x) % margin

		room.global_position.x -= offset
		State.player.global_position.x -= offset




func _on_door_to_the_hallway_object_used():
	if State.day == 6:
		return
	State.sceneManager.transtionTo("res://levels/hallway_scene.tscn");
	print('Go to the hallway');


func _on_staircase_up_object_used():
	if State.day == 6:
		print("ending 1")
	else:
		print("why?")

func _on_staircase_down_object_used():
	if State.day == 6:
		print("ending 2")
	else:
		print("why?")
