extends Node2D

var prefabrica = preload("res://scenes/fabrica_de_monstros.tscn")
var precomida = preload("res://scenes/comida.tscn")
var fabrica
var fab_comida
var pos_spawn = [232,232,232,408,408,408,320,320,320,497,145]#menores chances de monstros nas laterias 1/3
var dificultador = 3

func _ready():
	fabrica = prefabrica.instance()
	fab_comida = precomida.instance()


func _on_timer_timeout():
	if dificultador < 2.9:
		dificultador = dificultador - 0.002
	get_node("timer").set_wait_time(rand_range(0.6 , dificultador))	#mexer aqui para fazer frequencia de sapawn aumentar com delta por exemplo
	var monstros = fabrica.geraFrontRandomico()
	monstros.set_pos(Vector2(pos_spawn[int(rand_range(1,11))], -50))	#posicao na tela onde vai poder aparecer monstros(1 a 3 pois numero é truncado e 0.99=0)
	get_owner().add_child(monstros)


#-------------------Comida-------------------
func _on_timer_comida_timeout():
	get_node("timer_comida").set_wait_time(rand_range(10 , 25))#25
	var comidas = fab_comida.geraComidaRand()
	comidas.set_pos(Vector2(pos_spawn[int(rand_range(1,11))], -50))	#posicao na tela onde vai poder aparecer monstros(1 a 3 pois numero é truncado e 0.99=0)
	get_owner().add_child(comidas)