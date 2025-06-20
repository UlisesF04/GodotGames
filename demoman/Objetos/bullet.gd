class_name Bullet
extends Area2D
var speed=1000

func _process(delta: float) -> void:
	position.y -= speed*delta

func _on_body_entered(body: Node) -> void:
	queue_free()
	if body.name.begins_with("ufo"):
		var grupo = body.get_parent()
		if grupo and grupo.has_method("puntaje"):
			grupo.puntaje()
		body.queue_free()
