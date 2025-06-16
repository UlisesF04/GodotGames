class_name Space_Shooter
extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@export var speed=700
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var BULLET = preload("res://Objetos/bullet.tscn")

signal damaged

func _physics_process(delta: float) -> void:
	#Horizontal
	var direction = Input.get_axis("Left", "Right")
	velocity.x = speed * direction
	if direction != 0:
		sprite_2d.scale.x = direction
	#Disparar
	if Input.is_action_just_pressed("Jump"):
		animation_player.play("Disparar")
	move_and_slide()
	
func shooting():
	var bulletinstance = BULLET.instantiate()
	bulletinstance.position=$Sprite2D/Manito/ItemBlaster.global_position
	get_tree().current_scene.add_child(bulletinstance)
	
func taken_damage():
	damaged.emit()
