#executa dois metodos para mudar a imagem
tool
extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#fazer como o alien vire mutante, mudando de imagem de acordo com os
#parametros A B C
export(int, "A" , "B", "C") var tipo = 0 setget set_tipo

var score = 0
#carregando o array com os aliens
#inserindo a pontuação para cada alien
var atributos = [
	{
	texture = preload("res://sprites/InvaderA_sheet.png"),
	score = 10
	},
	{
	texture = preload("res://sprites/InvaderB_sheet.png"),
	score = 20
	},
	{
	texture = preload("res://sprites/InvaderC_sheet.png"),
	score=30
	}
]

func _ready():
	pass
	
func _draw():
	var atributo = atributos[tipo]
	get_node("sprite").set_texture(atributo.texture)
	score = atributo.score

#quando mudar o tipo, vai redesenhar a imagem
func set_tipo(val):
	tipo = val
	if is_inside_tree() and get_tree().is_editor_hint():
		update()