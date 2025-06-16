extends Node

var is_music_on := true

# El nodo actual que está reproduciendo música
var music_player: AudioStreamPlayer = null
var click=0

func set_is_music_on(value):
	is_music_on = value
	_update_music_state()

func _update_music_state():
	if click==0:
		if music_player:
			music_player.volume_db = -15 if is_music_on else -100
	else:
		if click==1:
			volume_25()
		else:
			if click==2:
				volume_50()
			else:
				if click==3:
					volume_75()

func volume_25():
	if music_player:
		music_player.volume_db= -55 if is_music_on else -100
		click=1

func volume_50():
	if music_player:
		music_player.volume_db= -40 if is_music_on else -100
		click=2

func volume_75():
	if music_player:
		music_player.volume_db= -25 if is_music_on else -100
		click=3
# Alternar estado ON/OFF
func toggle_music():
	is_music_on = !is_music_on
	_update_music_state()
