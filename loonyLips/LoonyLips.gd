extends Control

var questions = ['q1','q2', 'q3']
var response = []


func _ready():
	$VBoxContainer/Label.text = questions[0]
	$VBoxContainer/HBoxContainer/LineEdit.grab_focus()
	


func _on_LineEdit_text_entered(new_text):
	response.append( new_text)
	
	if len(response) == len(questions):
		$VBoxContainer/Label.text = "%s and %s and %s" % response 
		$VBoxContainer/HBoxContainer.queue_free()
		get_tree().reload_current_scene()
	else:
		$VBoxContainer/HBoxContainer/LineEdit.clear()
		$VBoxContainer/Label.text = questions[ len(response) ]


func _on_Button_pressed():
	_on_LineEdit_text_entered( $VBoxContainer/HBoxContainer/LineEdit.get_text() )
	
