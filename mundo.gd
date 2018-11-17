extends Node

func _on_Tiempo_timeout():
	get_tree().change_scene("res://telas/Game_over.tscn")
	
	
func _on_Area2D_meta(body):
	#get_tree().change_scene("res://telas/Triunfo.tscn")
	print("llego al fin")
	$"GUI/Txt-Tiempo/Tiempo".stop()
