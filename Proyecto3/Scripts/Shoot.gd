extends Area2D


export var pixelesSegundo = 140

export var direction = 1

#func _ready():
#	connect("area_entered",self,"_recibirDisparo")

#func _recibirDisparo(object):
#	object.queue_free()
#	queue_free()
#	print('hola')

func _process(delta):
	
	#position.x *= -1
	#$Sprite.scale.x *= -1
	
	if direction > 0:
		$Sprite.scale.x = 0.027
		#$Sprite.hflip = true
		position.x += pixelesSegundo * delta
	elif direction < 0:
		#$Sprite.hflip = false
		$Sprite.scale.x = -0.027	
		position.x -= pixelesSegundo * delta
	
	#pixelesSegundo = move_and_slide(pixelesSegundo)

	
	#if position.x < 0:
	#	$Sprite.scale.x = -1
	#	position.x += pixelesSegundo * delta		
	#elif position.x > 0:
	#	$Sprite.scale.x = 1
	#	position.x += pixelesSegundo * delta	
	
	#if position.x>920: 
		#body.get_name()
	#	queue_free()







