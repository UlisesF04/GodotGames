class_name BalaAlien
extends Area2D
var speed=1000

func _process(delta: float) -> void:
	position.y += speed*delta

func _on_body_entered(body: Node) -> void:
	queue_free()
	if body is Space_Shooter:
		if body.has_method("take_damage"):
			body.take_damage()
