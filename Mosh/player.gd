extends KinematicBody2D

var Patada_recargable = 0
var Patadas = 5
var Tiempo_fuera = 0
var punko_actual
var movimiento = Vector2()
var attack = false
const UP = Vector2(0, -1)
var VELOCIDAD = 255
const GRAVEDAD = 20
const SALTO = -500
signal Muerte_punk
signal Muerte_metacho
signal Castigo
signal Actualizar_Patada

func _physics_process(delta):
	
	Tiempo_fuera -= delta
	
	
	movimiento.y += GRAVEDAD
	movimiento.x = VELOCIDAD
	
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			movimiento.y = SALTO
			$Sprite.play("jump")
		elif !attack:
			$Sprite.play("Run")
	
	movimiento = move_and_slide(movimiento, UP) 

	if Input.is_action_pressed("Tecla"):
		
		
		if  Patadas > 0 and Tiempo_fuera <= 0 and punko_actual and punko_actual.Vida > 0:
			punko_actual.Muerte()
			punko_actual.position.x += 40
			Tiempo_fuera = 0.4
			Patadas -= 1
			emit_signal("Actualizar_Patada",Patadas)
			attack = true
			$Sprite.play("attack")
			
			if punko_actual.Vida == 0:
				punko_actual = null
				emit_signal("Muerte_punk")
				emit_signal("Muerte_metacho")
				
	Patada_recargable -= delta
	if Patadas < 5 and Patada_recargable < 0:
		Patadas += 1
		Patada_recargable = 3
		emit_signal("Actualizar_Patada",Patadas)
		

func _on_Sprite_animation_finished():
	if $Sprite.animation == "attack":
		attack = false
		$Sprite.play("Run")

func _on_Area2D_body_entered(body):
	punko_actual = body
	if $Sprite.animation != "attack":
		recibir_ataque()


func recibir_ataque():
	position.x -= 80
	emit_signal("Castigo")
