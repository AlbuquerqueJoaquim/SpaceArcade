extends Area2D

var vel = 250
#colocando o valor -1 no y pois o tiro ira subir
var dir = Vector2(0,-1)

func _ready():
	add_to_group("ship_shot")
	set_process(true)
	
func _process(delta):
	
#importacia do delta, se vc estiver em uma maquina rapida ou lenta 
#a velocidade de pixel ira ser a mesma 
	translate(dir * vel * delta)
	pass
	#matando o tiro (objeto) com queue_free
	if get_global_pos().y < 0:
		queue_free()
