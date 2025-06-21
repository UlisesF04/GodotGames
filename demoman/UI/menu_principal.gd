class_name Menu_Principal
extends Control

const LEVEL_1 = "res://Levels/level_1.tscn"
const SETTINGS = "res://UI/settings.tscn"
const LEVEL_SELECT = "res://UI/level_selector.tscn"

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file(LEVEL_1)


func _ready():
	VolumeManager.music_player = $AudioStreamPlayer
	VolumeManager._update_music_state()


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file(SETTINGS)

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_level_select_pressed() -> void:
	get_tree().change_scene_to_file(LEVEL_SELECT)
