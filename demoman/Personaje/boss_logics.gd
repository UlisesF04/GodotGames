class_name logica_jefe
extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
const BARRIL = preload("res://Objetos/barril.tscn")

func _process(delta):
	animation_player.play("Lanzar")

func launch_barrel():
	var instacia_barril = BARRIL.instantiate()
	instacia_barril.position=$BlueBodyCircle/BlueHandClosed.position
	add_child(instacia_barril)
