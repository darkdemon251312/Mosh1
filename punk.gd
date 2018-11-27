extends KinematicBody2D


var posicion_inicial
var posicion_final
var velocidad = 1
var Vida = 1


func _ready():
	$punk.play("walk")
	posicion_inicial = $".".position.x
	posicion_final = posicion_inicial + 100

func _process(delta):
	if (posicion_inicial <= posicion_final):
		$".".position.x -= velocidad
		
func Muerte():
	Vida -= 1
	if Vida == 0:
		$".".queue_free()
	


