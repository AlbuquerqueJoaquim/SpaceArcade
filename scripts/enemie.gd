extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export(int, "A" , "B", "C") var tipo = 0

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
	var atributo = atributos[tipo]
	#pedindo um nó
	get_node("sprite").set_texture(atributo.texture)
	score = atributo.score
	pass
