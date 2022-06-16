extends Node2D

func _ready():
	if game.score > 0:
		get_node("score").show()
		get_node("pontos").show()
		get_node("pontos").set_text(str(game.score))

func _on_comecar_pressed():
	get_node("fade_out").play("fade")


func _on_MenuButton_pressed():
	get_tree().change_scene("res://scenes/creditos.tscn")
	
func start():
	if game.gameover:
		game.lifes = 4
		game.score = 0
		get_tree().change_scene("res://scenes/main.tscn")
	else:
		get_tree().change_scene("res://scenes/tutorial.tscn")