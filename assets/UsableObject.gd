extends Node2D

@export var USE_MESSAGE: String;
@export var USE_TEXTURE: Texture;

signal object_used;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group('player_trigger') :
		var player: CharacterBody2D = area.get_parent();
		player.emit_signal('usable_object_hovered', self);
		print(player);

func _on_area_2d_area_exited(area):
	if area.is_in_group('player_trigger') :
		var player: CharacterBody2D = area.get_parent();
		player.emit_signal('usable_object_unhovered', self);
		print(player);

func _player_object_used():
	object_used.emit();

