class_name Level2
extends Node2D

const EscenaVictoria="res://UI/victory_royale.tscn"
const EscenaDerrota="res://UI/game_over.tscn"

var vidas_player = 5
var points = 0

signal life_counter(vidas_new)
signal scores(points)

func _process(delta: float) -> void:
	VolumeManager.music_player = $"../AudioStreamPlayer"
	VolumeManager._update_music_state()
	if points==2000:
		Global.puntaje=Global.puntaje+points
		get_tree().change_scene_to_file(EscenaVictoria)

func _on_izquierda_body_entered(body: Node2D) -> void:
	if body.name.begins_with("ufo"):
		var grupo = body.get_parent()
		if grupo and grupo.has_method("change_dir"):
			grupo.change_dir()

func _on_derecha_body_entered(body: Node2D) -> void:
	if body.name.begins_with("ufo"):
		var grupo = body.get_parent()
		if grupo and grupo.has_method("change_dir"):
			grupo.change_dir()

func gameover():
	if vidas_player==0:
		Global.puntaje=Global.puntaje+points
		get_tree().change_scene_to_file(EscenaDerrota)

func _on_space_shooter_damaged() -> void:
	vidas_player=vidas_player-1
	life_counter.emit(vidas_player)
	gameover()

func _on_uf_os_total_score(score: Variant) -> void:
	points = score
	scores.emit(points)
