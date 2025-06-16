class_name Credits
extends Control
var MainMenu = "res://UI/menu_principal.tscn"

func _ready():
	VolumeManager.music_player = $AudioStreamPlayer
	VolumeManager._update_music_state()
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(MainMenu)
