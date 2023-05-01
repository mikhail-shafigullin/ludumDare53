extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func teleportTo1Day():
	State.day = 1;
	State.location = State.LocationState.STATE_DEBUG;
	State.dayScripts = State.dayScripts_DEFAULT.duplicate(true)
	State.sceneManager.transtionTo("res://levels/main_room_scene.tscn");
	State.sceneManager.startFirstDay();
	
func teleportTo2Day():
	State.day = 2;
	State.location = State.LocationState.STATE_DEBUG;
	State.sceneManager.transtionTo("res://levels/main_room_scene.tscn");

func teleportTo3Day():
	State.day = 3;
	State.location = State.LocationState.STATE_DEBUG;
	State.sceneManager.transtionTo("res://levels/main_room_scene.tscn");

func teleportTo4Day():
	State.day = 4;
	State.location = State.LocationState.STATE_DEBUG;
	State.sceneManager.transtionTo("res://levels/main_room_scene.tscn");
	
func teleportTo5Day():
	State.day = 5;
	State.location = State.LocationState.STATE_DEBUG;
	State.sceneManager.transtionTo("res://levels/main_room_scene.tscn");
	
func teleportTo6Day():
	State.day = 6;
	State.dayScripts = State.dayScripts_DEFAULT.duplicate(true)
	
	State.location = State.LocationState.STATE_DEBUG;
	State.sceneManager.transtionTo("res://levels/main_room_scene.tscn");
	State.sceneManager.new_day()

func _on_1_day_button_pressed():
	teleportTo1Day();


func _on_2_day_button_pressed():
	teleportTo2Day();


func _on_3_day_button_pressed():
	teleportTo3Day();


func _on_4_day_button_pressed():
	teleportTo4Day();

func _on_5_day_button_pressed():
	teleportTo5Day();

func _on_6_day_button_pressed():
	teleportTo6Day();
