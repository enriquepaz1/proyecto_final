extends KinematicBody2D

const MAX_SPEED : float = 100.0
const GRAVITY : float = 25.0
const DISPARO = preload("res://Scenes/boss_shoot.tscn")
const DISPARO2 = preload("res://Scenes/boss_shoot2.tscn")
var velocity = Vector2.ZERO

var MinPorDisparo = 1
var MaxPorDisparo = 3

var Disparo1 = MaxPorDisparo
var Disparo2=0 

onready var state_machine = $AnimationTree.get("parameters/playback")
var die = false
var life = 5
#var dir = 1

func _ready():
	 $Sprite.scale.x = -1
	 velocity.x = MAX_SPEED
	 connect("area_entered",self,"recibirDisparo")
	
func recibirDisparo(object):
	object.queue_free()
	queue_free()
	
func  _next_to_left_wall():
	 return $LeftRay.is_colliding()

func _next_to_right_wall():
	 return $RightRay.is_colliding()

func _floor_detection():
	 return $Sprite/floorRay.is_colliding()
	
func _flip():
	 if _next_to_right_wall() or _next_to_left_wall() or !_floor_detection():
		 velocity *= -1		 
		 $Sprite.scale.x *= -1
		
func _physics_process(delta):
	velocity.y += GRAVITY
	_flip()
	velocity = move_and_slide(velocity)
	Disparo2 += delta
	if(Disparo2 >= Disparo1):
		Disparo2 = 0
		#if get_child().name("Boss_enemy"):
		Disparo1 = MinPorDisparo + \
			   randf() * (MaxPorDisparo - MinPorDisparo) 
		var disparo = DISPARO.instance()
		disparo.position = self.position + Vector2(-75,0)
		#disparo.direction = dir
		get_parent().add_child(disparo)
		
		if life == 3:
			var disparo2 = DISPARO2.instance()
			disparo2.position = self.position + Vector2(-10,-50)
			get_parent().add_child(disparo2)
		#if get_child().name("Boss_enemy"):

#		print ("Pium")	

func _on_Area2D_area_entered(area):
	life -= 1
	#area.queue_free()
	if life == 3:
		#die = true
		#esta funcionando
		state_machine.travel("hurt_boss")
	if life ==0:
		die = true	
		queue_free()
	print (area)	
	print ("boss enemy")
	
