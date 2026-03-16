extends CharacterBody2D

var velocidad = 400.0

# _ready se ejecuta una sola vez al arrancar
func _ready():
	# Lo ubicamos a la izquierda (X=50) y a la mitad de la altura (Y=324)
	position = Vector2(50, 324)

func _physics_process(delta):
	var direccion = 0
	if Input.is_physical_key_pressed(KEY_W):
		direccion -= 1
	if Input.is_physical_key_pressed(KEY_S):
		direccion += 1
		
	velocity.y = direccion * velocidad
	move_and_slide()
