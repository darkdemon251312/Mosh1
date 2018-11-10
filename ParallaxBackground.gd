extends ParallaxBackground

func _ready():
	set_process(true)
	
func _process(delta):
	offset.x -= 100 * delta
	set_scroll_offset(offset) 