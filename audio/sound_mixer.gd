extends Control
@onready var sound_slider = $SoundSlider
@onready var sound_button = $SoundButton


func _on_sound_button_pressed():
	sound_slider.visible = sound_button.button_pressed



func _on_sound_slider_drag_ended(value_changed):
	if value_changed:
		AudioServer.set_bus_volume_db(0, sound_slider.value)


func _on_sound_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)
