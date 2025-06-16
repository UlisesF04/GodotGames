extends Control
@onready var dialogue_label = $RichTextLabel
@onready var dialogue_box = $"."
var dialogue_lines: Array = []
var current_line := 0
var typing := false

signal disable()
signal enable()

func show_dialogue(lines: Array):
	dialogue_lines = lines
	current_line = 0
	dialogue_box.visible = true
	typing = true
	_disable_player()
	show_line()

func show_line():
	typing = true
	$TextureRect2.visible = false
	$RichTextLabel.text = ""
	var text = dialogue_lines[current_line]
	var char_index=0
	while char_index < text.length():
		$RichTextLabel.text += text[char_index]
		char_index += 1
		await get_tree().create_timer(0.02).timeout  # velocidad entre letras
	typing = false
	$TextureRect2.visible = true

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and not typing:
		if current_line < dialogue_lines.size() - 1:
			current_line += 1
			show_line()
		else:
			end_dialogue()

func end_dialogue():
	dialogue_box.visible = false
	dialogue_lines.clear()
	_enable_player()

func _disable_player():
	disable.emit()
	
func _enable_player():
	enable.emit()
