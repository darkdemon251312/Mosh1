extends KinematicBody2D

var Vida = 2
var posicion_inicial
var posicion_final
var velocidad = 1
var movimiento = Vector2()
const UP = Vector2(0, -1)
const GRAVEDAD = 20
const SALTO = -500

func _physics_process(delta):
	movimiento.y += GRAVEDAD
	movimiento.x = 0
	
	if is_on_floor():
		movimiento.y = SALTO

	movimiento = move_and_slide(movimiento, UP) 

func _ready():
	posicion_inicial = $".".position.x
	posicion_final = posicion_inicial + 100

func _process(delta):
	if (posicion_inicial <= posicion_final):
		$".".position.x -= velocidad
		
func Muerte():
	Vida -= 1
	if Vida == 0:
		$".".queue_free()
	

