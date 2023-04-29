extends CharacterBody2D
@export var speed := 200
@onready var body = $Body
@onready var animation_player = $AnimationPlayer



var is_walking_left := true
var is_running := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	body.flip_h = !is_walking_left;
	
	if abs(velocity.x) < 1:
		animation_player.play("idle_1")
		body.speed_scale = 1
	else:
		animation_player.play("walk_1")
		body.speed_scale = abs(velocity.x/110)
		
func _physics_process(_delta: float) -> void:

	var direction := Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)
	
	is_running = Input.get_action_strength("run")

	
	direction *= Vector2(1, 0)
	
	
	if direction.x != 0:
		is_walking_left = direction.x < 0

	if direction.length() > 1.0:
		direction = direction.normalized()
		
	if is_running:
		direction *= Vector2(2,1.5)
	velocity = speed * direction
	move_and_slide()
