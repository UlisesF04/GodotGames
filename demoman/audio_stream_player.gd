extends AudioStreamPlayer

@onready var audio_stream_player: AudioStreamPlayer = $"."

func _ready():
	VolumeManager.music_player = $"."
