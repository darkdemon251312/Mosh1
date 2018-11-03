extends KinematicBody2D

var direccion = 0
var movimiento_x = 0
var movimiento_y = 0

func _physics_process(delta):
	movimiento_y += 10
	
	direccion = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	
	if direccion == 1:
		movimiento_x = 200
		$prototipo.flip_h = false

		
	elif direccion == -1:
		movimiento_x = -200
		$prototipo.flip_h = true
		
	else:
		movimiento_x = 0
	
	if is_on_floor():
		movimiento_y = 0
		
		if Input.is_action_pressed("ui_up"):
			movimiento_y = -400
	
	move_and_slide(Vector2(movimiento_x, movimiento_y), Vector2(0, -1))