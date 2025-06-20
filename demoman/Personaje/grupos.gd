class_name UFOs
extends Node2D

var BULLET = preload("res://Objetos/bala_alien.tscn")
@export var velocidad := 100
var direccion = Vector2.RIGHT
@export var bajar := 20

signal punt_total(points)

func _process(delta: float) -> void:
	position += direccion * velocidad * delta

func _on_timer_timeout() -> void:
	var bulletinstance = BULLET.instantiate()
	var bulletinstance2 = BULLET.instantiate()
	var bulletinstance3 = BULLET.instantiate()
	var numerito = randi_range(1,5)

	match numerito:
		1:
			_disparar_si_existe("ufo1", bulletinstance)
		2:
			_disparar_si_existe("ufo2", bulletinstance)
		3:
			_disparar_si_existe("ufo3", bulletinstance)
		4:
			_disparar_si_existe("ufo4", bulletinstance)
		5:
			_disparar_si_existe("ufo5", bulletinstance)
			

func _disparar_si_existe(ufo_name: String, bullet_instance: Node2D):
	if has_node(ufo_name):
		var ufo = get_node(ufo_name)
		if ufo.has_node("Marker2D"):
			bullet_instance.position = ufo.get_node("Marker2D").global_position
			get_tree().current_scene.add_child(bullet_instance)
			
func change_dir():
	direccion*=-1
	position.y += bajar
	
func puntaje():
	punt_total.emit(100)
