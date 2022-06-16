extends "res://scripts/classe_inimigo.gd"

var vel = 100
var rot = 0
var y = 1

func _process(delta):
	set_pos(get_pos() + Vector2(0, y) * vel * delta)#vel mosntro
	

func _destroi():	#chamado por classe_inimigo
	get_node("sample").play("%d"%(int(rand_range(0 , 2))))	#Rever essa saida maxima bem suspeita capaz de nao pegar vdd num maximo de sons na bboteca
	get_node("anim").play("tchau")
	get_node("part_over").start()
	get_node("sprite").hide()
	y = 0.44	#vel do chao
	
func _inicia():#chamado classe_inimigo
	set_process(true)