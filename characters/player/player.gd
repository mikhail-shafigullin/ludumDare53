extends CharacterBody2D
@export var speed := 200
@onready var body = $Body
@onready var animation_player = $AnimationPlayer

signal usable_object_hovered(usable_object);
signal usable_object_unhovered(usable_object);

var is_walking_left := true
var is_running := false
var idel_name := "idle_90"
var hovered_item: Node2D;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	body.flip_h = !is_walking_left;
	
	if abs(velocity.x) < 1:
		animation_player.play(idel_name)
		body.speed_scale = 1
	else:
		animation_player.play("walk_1")
		body.speed_scale = abs(velocity.x/80)
		
	var is_item_used = Input.is_action_just_pressed("use");
	if is_item_used && hovered_item && !State.player_is_busy:
		if !hovered_item.item_on_cooldown && State.player_can_use:
			hovered_item.emit_signal('object_used');


func _physics_process(_delta: float) -> void:
	
	if State.player_is_busy:
		velocity = Vector2(0, 0)
		return
	
	var direction := Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	is_running = Input.get_action_strength("run")
	
	if direction.x == 0:
		if direction.y != 0:
			if direction.y > 0:
				idel_name = "idle_300f"
			else:
				idel_name = "idle_300b"
	else:
		idel_name = "idle_90"
	
	direction *= Vector2(1, 0)
	
	
	if direction.x != 0:
		is_walking_left = direction.x < 0

	if direction.length() > 1.0:
		direction = direction.normalized()
		
	if is_running:
		direction *= Vector2(2,1.5)
	velocity = speed * direction
	move_and_slide()

func _on_usable_object_hovered(usable_object: Node2D):
	hovered_item = usable_object;
	if State.ihud:
		if hovered_item.USE_MESSAGE:
			State.ihud.item_set_name(hovered_item.USE_MESSAGE)
		else:
			State.ihud.item_set_name("Use?")
			
		if hovered_item.USE_TEXTURE:
			State.ihud.item_set_image(hovered_item.USE_TEXTURE)
		else:
			State.ihud.item_set_image(null)


func _on_usable_object_unhovered(usable_object):
	hovered_item = null;
	if State.ihud:
		State.ihud.item_clear()

func death():
	State.player.global_position = Vector2(9001,9001)
	State.sceneManager.play_dialogue("res://assets/dialogue/death.dialogue")
			
	print("player is ded :(")
