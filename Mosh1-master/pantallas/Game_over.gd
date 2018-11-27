extends Node

func _on_Button_Restart_released():
	get_tree().change_scene("res://mundo.tscn")
	
func _on_Button_Menu_pressed():
	get_tree().change_scene("res://telas/Menu.tscn")
