extends Node

func _on_Button_Restart_released():
	print("boton de restart")
	get_tree().change_scene("res://mundo.tscn")
