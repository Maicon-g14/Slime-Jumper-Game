extends Area2D

export var vida = 2
export var pontos = 10

func _ready():
	add_to_group(game.GRUPO_INIMIGO)
	_inicia()

func aplica_dano(valor):
	vida -= valor
	if vida <= 0:
		_destroi()
		game.score += pontos
		remove_from_group(game.GRUPO_INIMIGO)
		game.getCamera().shake()
	
func inicia():#evita erro caso falhar conexao com monstros.gd
	pass
	
func _destroi():#evita erro idem
	pass