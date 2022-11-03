extends Control

var dialog = [
' Felicidades acabaste con el juego,Este juego fue desarrollado por Enrique Paz Romero Contribucion de imaganes:  Pinterest, Craftpix y Open Game Art GRACIAS!!!'
]  

var dialog_index = 0
var text_speed = 0.1

func _ready(): 
	 $RichTextLabel.bbcode_text = ''

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		if dialog_index < dialog.size():
			$RichTextLabel.bbcode_text = dialog[dialog_index]
			$RichTextLabel.percent_visible = 0
			var tween_duration = text_speed * dialog[dialog_index].length()
			$Tween.interpolate_property(
			$RichTextLabel, "percent_visible",0,1,tween_duration,
			Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
		)
		$Tween.start()


