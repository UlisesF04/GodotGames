class_name LogicaLevel1
extends Node2D
@onready var player_ui: CanvasLayer = $"../Player_UI"
@export var player_life=3

const NextLevel="res://Levels/level_2.tscn"
const EscenaDerrota="res://UI/game_over.tscn"

signal player_health(new_player_health)
var dialogo = [
	"Buenas",
	"A la derecha, subiendo las plataformas, hay un enemigo tirando barriles y a su lado hay una moneda",
	"Esquiva los barriles que te tira, si agarras la moneda ganas",
	"Tenes tres vidas, si te pega un barril perdes una",
	"Suerte."
]

func _ready():
	VolumeManager.music_player = $"../AudioStreamPlayer"
	VolumeManager._update_music_state()
	$"../Player_UI/Dialogos".show_dialogue(dialogo)
	
func life_less():
	player_life=player_life-1
	player_health.emit(player_life)
	
func game_over():
	if player_life==0:
		get_tree().change_scene_to_file(EscenaDerrota)

func victory():
	get_tree().change_scene_to_file(NextLevel)

func _on_pj_animado_daño_recibido() -> void:
		life_less()
		game_over()
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	victory()

func _on_dialogos_disable() -> void:
	$"../Personajes/PJAnimado".can_move=false

func _on_dialogos_enable() -> void:
	$"../Personajes/PJAnimado".can_move=true


func _on_límite_body_entered(body: Node2D) -> void:
	if body.name == "PJAnimado":
		var spawn = get_parent().get_node("SpawnPoint")
		body.global_position=spawn.global_position
	if body is Barril:
		body.queue_free()
