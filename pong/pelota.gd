extends CharacterBody2D

var velocidad_inicial = 500.0
var puntos_p1 = 0
var puntos_p2 = 0

func _ready():
	position = Vector2(576, 324)
	iniciar_saque(1)

func _physics_process(delta):
	var choque = move_and_collide(velocity * delta)
	
	if choque:
		velocity = velocity.bounce(choque.get_normal())
		

	if position.x < 0:
		puntos_p2 += 1
		$"%Puntos2".text = str(puntos_p2)
		iniciar_saque(1)
		
	if position.x > 1152:
		puntos_p1 += 1
		$"%Puntos1".text = str(puntos_p1)
		iniciar_saque(-1)

func iniciar_saque(hacia_donde):
	position = Vector2(576, 324)
	velocity = Vector2.ZERO
	
	await get_tree().create_timer(1.0).timeout
	
	var angulo_y = randf_range(-0.5, 0.5)
	velocity = Vector2(hacia_donde, angulo_y).normalized() * velocidad_inicial
