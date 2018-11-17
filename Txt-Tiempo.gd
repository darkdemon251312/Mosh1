extends Label

var minutos
var segundos

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	if int(get_node("Tiempo").get_time_left()):
		minutos = int(get_node("Tiempo").get_time_left() / 60) 
		segundos = int(get_node("Tiempo").get_time_left()) % 60
		set_text(str(minutos) + ":" + str(segundos))
	
