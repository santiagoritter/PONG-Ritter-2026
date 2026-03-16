extends CharacterBody2D

var velocidad = 400.0

func _ready():

	position = Vector2(100, 0)

func _physics_process(delta):
	var direccion = 0
	if Input.is_action_pressed("ui_up"):
		direccion -= 1
	if Input.is_action_pressed("ui_down"):
		direccion += 1
		
	velocity.y = direccion * velocidad
	move_and_slide()
