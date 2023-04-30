extends CanvasLayer
@onready var novel = $Novel
@onready var item_icon = $Item/ItemIcon
@onready var item_name = $Item/ItemName
@onready var item = $Item


# Called when the node enters the scene tree for the first time.
func _ready():
	State.ihud = self


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

func item_set_image(imageTexture: Texture) -> void:
	item_icon.texture = imageTexture

func item_set_name(_name: String) -> void:
	item.show()
	item_name.text = _name

func item_clear() -> void:
	item.hide()
