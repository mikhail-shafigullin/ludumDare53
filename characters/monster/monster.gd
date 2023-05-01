extends CharacterBody2D

@export var facing_left := true
@export var walk := false
@export var speed := 25
@export var appirence_day := 6

# Called when the node enters the scene tree for the first time.
func _ready():
	if not facing_left:
		$Body.flip_h = true
	
	if walk:
		$Body/AnimationPlayer.play("walk")
		
	if State.day != appirence_day:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if walk:
		if facing_left:
			velocity = Vector2(-speed,0)
		else:
			velocity = Vector2(speed,0)
	move_and_slide()

func _on_body_trigger_area_entered(area):
	if area.is_in_group('player_trigger') :
		var player: CharacterBody2D = area.get_parent();
		player.death()
