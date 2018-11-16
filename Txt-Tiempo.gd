extends Label

func _ready():
	set_physics_process(true)
	
func _physics_process(delta):
	var Minutos = int(get_node("Tiempo").get_time_left() / 60) 
	var Segundos = int(get_node("Tiempo").get_time_left()) % 60
	set_text(str(Minutos) + ":" + str(Segundos))
	
