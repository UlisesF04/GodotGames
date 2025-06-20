extends CanvasLayer

const LEVEL_1 = "res://Levels/level_1.tscn"
var Creditos = "res://UI/creditos.tscn"

func _ready():
	VolumeManager.music_player = $AudioStreamPlayer
	VolumeManager._update_music_state()
	$TextureRect/VBoxContainer/Label2.text="PUNTAJE : "+str(Global.puntaje)

func _on_button_button_down() -> void:
	get_tree().change_scene_to_file(LEVEL_1)


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file(Creditos)
