extends Node2D

@export var USE_MESSAGE: String;
@export var USE_TEXTURE: Texture;
@onready var cooldown_timer = $CooldownTimer

var item_on_cooldown := false

const Balloon = preload("res://assets/dialogue/ballon/balloon.tscn")

signal object_used;

# Called when the node enters the scene tree for the first time.
func _ready():
	cooldown_timer.timeout.connect(func(): item_on_cooldown = false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group('player_trigger') :
		var player: CharacterBody2D = area.get_parent();
		player.emit_signal('usable_object_hovered', self);

func _on_area_2d_area_exited(area):
	if area.is_in_group('player_trigger') :
		var player: CharacterBody2D = area.get_parent();
		player.emit_signal('usable_object_unhovered', self);

func _player_object_used():
	object_used.emit();
	
func play_dialogue(path_to_dialogue: String):
	if State.player_is_busy:
		return
	
	State.player_is_busy = true
	item_on_cooldown = true
	
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(load(path_to_dialogue), "start")
	balloon.tree_exiting.connect(_on_dialog_end)

func _on_dialog_end() -> void:
	State.player_is_busy = false
	cooldown_timer.start()
