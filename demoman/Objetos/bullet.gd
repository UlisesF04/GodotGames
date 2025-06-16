class_name Bullet
extends Area2D
var speed=1000

func _process(delta: float) -> void:
	position.y -= speed*delta

func _on_body_entered(body: Node) -> void:
	queue_free()
	if body.name == "ufo1" or "ufo2" or "ufo3" or "ufo4" or "ufo5":
		print("sexo")
