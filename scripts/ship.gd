extends Area2D

#constante
const VEL = 100
#preload uma funcao reservada pelo GDScript para carregar um arquivo
#em tempo de copilção
var prev_shot = preload("res://scenes/ship_shot.tscn")
#declarando variavel
var left
var right
var dir = 0
var lazer

var prev_lazer = false

func _ready():
	set_process(true)
	
func _process(delta):
	
	dir = 0
	#ação..quando algum botão ou joystick for prrecionado 
	right = Input.is_action_pressed("ui_right")
	left = Input.is_action_pressed("ui_left")
	lazer = Input.is_action_pressed("disparo")
	
	if right:
		dir += 1
		
	if left:
		dir -= 1
		
	#fazendo a nave se movimentar
	translate(Vector2(1,0) * VEL * dir * delta)
	
	#se...qual a minha posição global
	if get_global_pos().x < 7:
		set_global_pos(Vector2(7, get_global_pos().y))
		
	if get_global_pos().x > 173:
		set_global_pos(Vector2(173, get_global_pos().y))
		#quantos cenas estao no grupo ship_sot, quando o tiro morre 
		#ele ira sair o proximo tiro
	if lazer and not prev_lazer and get_tree().get_nodes_in_group("ship_shot").size() == 0:
		var shot = prev_shot.instance()
		get_parent().add_child(shot)
		shot.set_global_pos(get_global_pos())
		
	prev_lazer = lazer
	pass
	
