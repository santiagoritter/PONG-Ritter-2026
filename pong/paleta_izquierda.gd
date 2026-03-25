extends CharacterBody2D

var velocidad = 400.0
var pos_x = 50

func _ready():
	position = Vector2(pos_x, 324)

func _physics_process(delta):
	var dir = 0
	if Input.is_physical_key_pressed(KEY_W):
		dir -= 1
	if Input.is_physical_key_pressed(KEY_S):
		dir += 1
		
	velocity.y = dir * velocidad
	move_and_slide()
	position.x = pos_x


func _on_btn_continuar_pressed() -> void:
	pass


func _on_btn_reiniciar_pressed() -> void:
	pass
