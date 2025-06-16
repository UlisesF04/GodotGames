class_name Settings
extends Control

var Menu = "res://UI/menu_principal.tscn"

func _ready():
	VolumeManager.music_player = $AudioStreamPlayer
	VolumeManager._update_music_state()

func _on_musica_toggled(toggled_on: bool) -> void:
	VolumeManager.toggle_music()
	# Actualizás el texto del botón si querés mostrar estado
	if VolumeManager.is_music_on:
		$TextureRect/VBoxContainer/Musica.text = "Música: ON"
	else:
		$TextureRect/VBoxContainer/Musica.text = "Música: OFF"
	
func _on_volver_pressed() -> void:
	get_tree().change_scene_to_file(Menu)

func _on_twenty_five_pressed() -> void:
	VolumeManager.volume_25()

func _on_fifty_pressed() -> void:
	VolumeManager.volume_50()

func _on_seventy_five_pressed() -> void:
	VolumeManager.volume_75()
