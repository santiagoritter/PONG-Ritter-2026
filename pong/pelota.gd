extends CharacterBody2D

var velocidad = 500.0
var direccion = Vector2(1, 1).normalized() 

func _ready():
	position = Vector2(576, 324)

func _physics_process(delta):
	var choque = move_and_collide(direccion * velocidad * delta)
	
	if choque:
		direccion = direccion.bounce(choque.get_normal())
