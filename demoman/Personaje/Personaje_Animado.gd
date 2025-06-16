class_name Movimiento_Rectilineo_Uniformemente_Animado
extends CharacterBody2D

@export var gravity =800
@export var speed=250
@export var jump_speed=370
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var can_move = true
signal daño_recibido

func _physics_process(delta: float) -> void:
	
	if can_move:
		# horizontal
		var movement_left = Input.is_action_pressed("Left")
		var movement_right = Input.is_action_pressed("Right")
		var direction = Input.get_axis("Left", "Right")
		velocity.x = speed * direction

		if direction != 0:
			animated_sprite_2d.scale.x = direction

		# gravedad
		if not is_on_floor():
			velocity.y += gravity * delta
			animated_sprite_2d.play("Jump", 1.5, false)
		else:
			if movement_left or movement_right:
				animated_sprite_2d.play("Run", 2, false)
			else:
				animated_sprite_2d.play("Idle")
				
		# salto
		var jump_pressed = Input.is_action_just_pressed("Jump")
		if jump_pressed and is_on_floor():
			velocity.y -= jump_speed
		move_and_slide()
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Ha ingresado al area: ", body.name)
	
	
func damage_taken():
	print("Recibiste daño")
	daño_recibido.emit()
