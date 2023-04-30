extends Node2D

@export var margin := 260
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


