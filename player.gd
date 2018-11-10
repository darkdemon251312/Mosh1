extends KinematicBody2D

var movimiento = Vector2()
const UP = Vector2(0, -1)
const VELOCIDAD = 215
const GRAVEDAD = 20
const SALTO = -550

func _physics_process(delta):
	
	movimiento.y += GRAVEDAD
	movimiento.x = VELOCIDAD
	
	$Sprite.flip_h = false 
	
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			movimiento.y = SALTO
			$Sprite.play("jump")
		else:
			$Sprite.play("run")
	
	movimiento = move_and_slide(movimiento, UP) 