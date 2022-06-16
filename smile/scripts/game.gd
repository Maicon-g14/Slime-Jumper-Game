extends Node
#In particles preprocess mostra quando começa paticulas, portanto valor 2 futuro faz com q a cena começe com elas ja sendo emitidas

const GRUPO_INIMIGO = "inimigos"
const NA_MIRA = "pode_atacar"
const COMIDA = "da_vida"

var score = 0 setget setScore	#, getScore
var lifes = 4 setget setLifes
var gameover = false

signal score_changed
signal lifes_changed

func _ready():
	randomize()
	
func getCamera():	#chamado por classe_inimigo
	return get_tree().get_root().get_node("main").get_node("camera")
	
func setScore(valor):	#chamado por classe_inimigo/pega scores perdidos pelo codigo
	if valor > 0:
		score = valor
		emit_signal("score_changed")
		
func setLifes(valor):	#chamado por player
	lifes = valor
	emit_signal("lifes_changed")
	if lifes < 1:
		gameover = true
		get_tree().change_scene("res://scenes/game_over.tscn")