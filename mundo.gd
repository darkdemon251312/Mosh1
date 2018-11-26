extends Node

var Cuenta_regresiva = 60
var Game_over = false
var Tiempo_Global = 0
var Tiempos_Clave = [32, 67, 120, 170, 1000]
var Indice_siguiente_tiempo_clave = 0

func Revisar_eventos():
	if Tiempo_Global > Tiempos_Clave[Indice_siguiente_tiempo_clave]:
		
		if Indice_siguiente_tiempo_clave == 0:
			$player.VELOCIDAD = 400
		elif Indice_siguiente_tiempo_clave == 1:
			$player.VELOCIDAD = 600
		elif Indice_siguiente_tiempo_clave == 2:
			$player.VELOCIDAD = 400
		else:
			$player.VELOCIDAD = 800
		Indice_siguiente_tiempo_clave += 1
	pass

func _ready():
	Cuenta_regresiva = 60
	Game_over = false

func _process(delta):
	if Game_over:
		return
	
	#Evaluar tiempo global
	Tiempo_Global += delta
	Revisar_eventos()
	
	#Evaluar cuenta regresiva
	Cuenta_regresiva -= delta
	$"GUI/Txt-Tiempo".actualizar_Tiempo(Cuenta_regresiva)
	if Cuenta_regresiva <= 0:
		Game_over = true
		_on_Tiempo_timeout()

#si el tiempo es igual a 0 el jugador pierde y muestra la pantalla de Game over
func _on_Tiempo_timeout():
	get_tree().change_scene("res://pantallas/Game_over.tscn")

#cuando el jugado mate a un enemigo que este corriendo gana 2 segundos de tiempo en el reloj
func _on_player_Muerte_punk():
	Cuenta_regresiva += 2

#cada vez que el jugador mate a un enemigo que salte gana 5 segundos de tiempo en el reloj
func _on_player_Muerte_metacho():
	Cuenta_regresiva += 5

#cada vez que el jugador es golpeado con un enemigo se descuenta el reloj
func _on_player_Castigo():
	Cuenta_regresiva -= 3

#cuando el personaje llega a la meta sale pantalla de triunfo
func _on_meta_body_entered(body):
	get_tree().change_scene("res://pantallas/Triunfo.tscn")

