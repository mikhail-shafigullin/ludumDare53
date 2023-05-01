extends Node2D

var knockSound = preload("res://audio/KnockSound01.wav");
var openDoor = preload("res://audio/OpenDoor01.wav");
var scratchSound = preload("res://audio/ScratchSound0101.wav");
var nightKnock = preload("res://audio/NightKnock01.wav");
var ePiano = preload("res://audio/ePiano.mp3");
var darkOne = preload("res://audio/darkOne.mp3");
var placeholder = preload("res://audio/placeholder.mp3");

enum SoundLocation{
	LEFT_FAR,
	LEFT_NEAR,
	RIGHT_FAR,
	RIGHT_NEAR,
	NON_POSITIONAL
}

var dictionary = {
	'knockSound': knockSound,
	'openDoor': openDoor,
	'scratchSound': scratchSound,
	'nightKnock': nightKnock,
	'ePiano': ePiano,
	'darkOne': darkOne,
	'placeholder': placeholder
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func playLeftFarSound(soundKey: String):
	playSoundInto(soundKey, SoundLocation.LEFT_FAR);
	
func playLeftNearSound(soundKey: String):
	playSoundInto(soundKey, SoundLocation.LEFT_NEAR);
	
func playRightFarSound(soundKey: String):
	playSoundInto(soundKey, SoundLocation.RIGHT_FAR);
	
func playRightNearSound(soundKey: String):
	playSoundInto(soundKey, SoundLocation.RIGHT_NEAR);
	
func stopRightNearSound():
	stopSoundInto(SoundLocation.RIGHT_NEAR);

func playNonPositionalSound(soundKey: String):
	playSoundInto(soundKey, SoundLocation.NON_POSITIONAL);
	
func stopNonPositionalSound():
	stopSoundInto(SoundLocation.NON_POSITIONAL);

func chooseSoundSource(location: SoundLocation):
	match (location):
		SoundLocation.LEFT_FAR:
			return $LeftFarSound;
		SoundLocation.LEFT_NEAR:
			return $LeftNearSound;
		SoundLocation.RIGHT_NEAR:
			return $RightNearSound;
		SoundLocation.RIGHT_FAR:
			return $RightFarSound;
		SoundLocation.NON_POSITIONAL:
			return $NonPositionalSound;
	
	
func playSoundInto(soundKey: String, location: SoundLocation):
	var soundLocation = chooseSoundSource(location);
	soundLocation.stream = dictionary[soundKey];
	soundLocation.play();
	
func stopSoundInto(location: SoundLocation):
	var soundLocation = chooseSoundSource(location);
	soundLocation.stop();
