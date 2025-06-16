class_name HUD_Player
extends CanvasLayer

const VidaPerdida = preload("res://Assets/kenney_scribble-platformer/PNG/Default/ui_numX.png")
const Vida = preload("res://Assets/kenney_scribble-platformer/PNG/Default/tile_heart.png")


func _on_level_logic_player_health(new_player_health: Variant) -> void:
	$TextureRect/HBoxContainer/TextureRect3.texture = Vida if new_player_health>=1 else VidaPerdida
	$TextureRect/HBoxContainer/TextureRect2.texture = Vida if new_player_health>=2 else VidaPerdida
	$TextureRect/HBoxContainer/TextureRect.texture = Vida if new_player_health>=3 else VidaPerdida
