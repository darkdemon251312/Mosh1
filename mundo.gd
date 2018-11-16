extends Node

func _on_Tiempo_timeout():
	get_tree().change_scene("res://telas/Game_over.tscn")
