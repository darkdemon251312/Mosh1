extends KinematicBody2D

var movimiento = Vector2()
var attack = false
const UP = Vector2(0, -1)
const VELOCIDAD = 215
const GRAVEDAD = 20
const SALTO = -500


func _physics_process(delta):
	
	movimiento.y += GRAVEDAD
	movimiento.x = VELOCIDAD
	
	
	if is_on_floor():
		
		if Input.is_action_pressed("ui_up"):
			movimiento.y = SALTO
			$Sprite.play("jump")
		elif !attack:
			$Sprite.play("run")
	
	movimiento = move_and_slide(movimiento, UP) 

	if Input.is_action_pressed("Tecla"):
		attack = true
		$Sprite.play("attack")
	

func _on_Sprite_animation_finished():
	if $Sprite.animation == "attack" :
		attack = false
		$Sprite.play("run")


