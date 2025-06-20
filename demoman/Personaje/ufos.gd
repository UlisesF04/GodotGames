extends Node2D

signal total_score(score)

var lose=0
var puntos=0

func _on_grupos_punt_total(points: Variant) -> void:
	var sumas = points
	puntos = puntos+sumas
	total_score.emit(puntos)
	
func _on_grupos_2_punt_total(points: Variant) -> void:
	var sumas = points
	puntos = puntos+sumas
	total_score.emit(puntos)
	
func _on_grupos_3_punt_total(points: Variant) -> void:
	var sumas = points
	puntos = puntos+sumas
	total_score.emit(puntos)
	
func _on_grupos_4_punt_total(points: Variant) -> void:
	var sumas = points
	puntos = puntos+sumas
	total_score.emit(puntos)
