extends Area2D

export var pixelesSegundo : int = 180
#export var direction = 1
 
func _ready():
	pass

func _process(delta):
	position.x -= pixelesSegundo * delta 
	
	if position.x>820: 
		#body.get_name()
		queue_free()




