class_name Barril
extends RigidBody2D
var damage=false

func _on_body_entered(body: Node) -> void:
	if body is Movimiento_Rectilineo_Uniformemente_Animado:
		if not damage:
			damage=true
			queue_free()
			if body.has_method("damage_taken"):
				body.damage_taken()
