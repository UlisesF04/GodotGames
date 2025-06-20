class_name HUD_SpaceInvaders
extends CanvasLayer

const Life = preload("res://Assets/kenney_scribble-platformer/PNG/Default/tile_heart.png")
const LifeLoss = preload("res://Assets/kenney_ui-pack-rpg-expansion/PNG/iconCross_grey.png")

func _ready() -> void:
	$Label3.text = str(0)

func _on_logic_lvl_2_life_counter(vidas_new: Variant) -> void:
	$TextureRect/HBoxContainer/TextureRect5.texture= Life if vidas_new>=1 else LifeLoss
	$TextureRect/HBoxContainer/TextureRect4.texture= Life if vidas_new>=2 else LifeLoss
	$TextureRect/HBoxContainer/TextureRect3.texture= Life if vidas_new>=3 else LifeLoss
	$TextureRect/HBoxContainer/TextureRect2.texture= Life if vidas_new>=4 else LifeLoss
	$TextureRect/HBoxContainer/TextureRect1.texture= Life if vidas_new>=5 else LifeLoss
	


func _on_logic_lvl_2_scores(points: Variant) -> void:
	$Label3.text = str(points)
