extends CanvasLayer
@onready var novel = $Novel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func novel_show() -> void:
	novel.show()
	State.player_is_busy = true

func novel_hide() -> void:
	novel.hide()
	State.player_is_busy = false

func novel_set_image(imagePath: String) -> void:
	novel.get_node("Image").texture = load(imagePath)
