extends Area2D

var block_animation = false
var defesaA = false
var defesaD = false

func _ready():
	set_process(true)



func _process(delta):
	#-------------------------------Defesa A(A)--------------------------
	if (Input.is_action_pressed("evasiva_A") and !block_animation and !defesaA and !defesaD):
		get_parent().get_node("ataque").play("defesaA")
		block_animation = true
		defesaA = true
		
	elif (Input.is_action_pressed("evasiva_D") and !block_animation and defesaA and !defesaD):
		get_parent().get_node("ataque").play("meio_A")
		block_animation = true
		defesaA = false
		
		
	elif (Input.is_action_pressed("esquerda") and !block_animation and !defesaA and !defesaD):
		get_parent().get_node("ataque").play("deslocamentoA")
		block_animation = true
		
	#-------------------------------Defesa D(D)--------------------------
	if (Input.is_action_pressed("evasiva_D") and !block_animation and !defesaD  and !defesaA):
		get_parent().get_node("ataque").play("defesaD")
		block_animation = true
		defesaD = true
	
	elif (Input.is_action_pressed("evasiva_A") and !block_animation and defesaD and !defesaA):
		get_parent().get_node("ataque").play("meio_D")
		block_animation = true
		defesaD = false
		
		
	elif (Input.is_action_pressed("direita") and !block_animation and !defesaD and !defesaA):
		get_parent().get_node("ataque").play("deslocamentoD")
		block_animation = true
		
		
	if (Input.is_action_pressed("frente") and !block_animation and !defesaD and !defesaA):
		get_parent().get_node("ataque").play("deslocamentoW")
		block_animation = true
		
		
	
func retira_vida():	#interno
	if game.lifes > 0:
		game.lifes -= 1

func _on_slaine_area_enter( area ):
	if area.is_in_group(game.GRUPO_INIMIGO) and area.is_in_group(game.NA_MIRA):
		if area.has_method("aplica_dano"):
			area.aplica_dano(2)#quantia de dano que player aplica ao encostras no mosntro
			
	elif area.is_in_group(game.GRUPO_INIMIGO):
		
		if area.has_method("aplica_dano") and defesaA:
			aplica_dano_player()
			area.aplica_dano(2)
			
		if area.has_method("aplica_dano") and defesaD:
			aplica_dano_player()
			area.aplica_dano(2)
			
		elif area.has_method("aplica_dano"):
			aplica_dano_player()
			
			
	if area.is_in_group(game.COMIDA):
		if game.lifes < 7:
			game.lifes += 1
			area.queue_free()

func _on_ataque_finished():
	block_animation = false
	
func aplica_dano_player():
	get_node("hit").play("hit")
	get_parent().get_node("hit").play("hit_player")
	retira_vida()
	return