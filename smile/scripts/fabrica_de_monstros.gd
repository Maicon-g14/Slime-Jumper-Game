extends Node2D

func geraFrontRandomico():		#Faz com que monstros novos add entrem automaticamente
	return get_children()[randi() % get_children().size()].duplicate()