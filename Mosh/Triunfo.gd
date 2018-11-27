extends Node

func _on_TextureButton_pressed():
	get_tree().change_scene("res://mundo.tscn")
	
func _ready():
	$Victoria.play("victory")
