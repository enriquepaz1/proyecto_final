extends KinematicBody2D

const MAX_SPEED : float = 100.0
const GRAVITY : float = 25.0

var velocity = Vector2.ZERO
#var hurt = false
var die = false
var life = 2
onready var state_machine = $AnimationTree.get("parameters/playback")




#func _ready():
#	 $Sprite.scale.x = -1
#	 velocity.x = MAX_SPEED
#	 connect("area_entered",self,"_recibirDisparo")

func  _next_to_left_wall():
	 return $LeftRay.is_colliding()

func _next_to_right_wall():
	 return $RightRay.is_colliding()

func _floor_detection():
	 return $Sprite/floorRay.is_colliding()
	
func _flip():
	 if _next_to_right_wall() or _next_to_left_wall() or !_floor_detection():
		 velocity.x *= -1
		 $Sprite.scale.x *= -1
		
func _physics_process(delta):
	velocity.y += GRAVITY
	_flip()
	velocity = move_and_slide(velocity)
	
	
	#if die:
	#	state_machine.travel("die_enemy")
	
#func _recibirDisparo(object):
#	 object.queue_free()
#	 queue_free()
#	 print('hola2')



func _on_Area2D_area_entered(area):
#	hurt = true
	area.queue_free()
	life -= 1
	#area.queue_free()
	if life == 0:
		die = true
		#esta funcionando
		#state_machine.travel("die_enemy")
		queue_free()
	print (area)	
	print ("ouch enemy")

	
#


	



