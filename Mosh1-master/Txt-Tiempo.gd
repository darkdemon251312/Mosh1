extends Label

var minutos
var segundos

func _ready():
	set_physics_process(true)
	
func actualizar_Tiempo(Tiempo):
	if Tiempo:
		minutos = int(Tiempo) / 60
		segundos = int(Tiempo) % 60
		set_text(str(minutos) + ":" + str(segundos))
	
