extends Control

const CLIMB_UP = "res://Levels/level_1.tscn"
const SPACE_SHOOTER = "res://Levels/level_2.tscn"
const MENU = "res://UI/menu_principal.tscn"

func _ready():
	VolumeManager.music_player = $AudioStreamPlayer
	VolumeManager._update_music_state()

func _on_climb_up_pressed() -> void:
	get_tree().change_scene_to_file(CLIMB_UP)

func _on_space_shooters_pressed() -> void:
	get_tree().change_scene_to_file(SPACE_SHOOTER)

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file(MENU)
