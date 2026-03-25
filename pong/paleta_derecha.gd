extends CharacterBody2D

var velocidad = 450.0
var pos_x = 1100
var es_cpu = false

var offset_aleatorio = 0.0
var timer_offset = 0.0

func _ready():
	global_position = Vector2(pos_x, 324)

func _physics_process(delta):
	var dir = 0
	var pelota = get_node("%Pelota")
	
	timer_offset += delta
	if timer_offset > 0.5:
		offset_aleatorio = randf_range(-40, 40)
		timer_offset = 0
		
	if es_cpu:
		if pelota.velocity.x < 0:
			var centro_y = 324
			if global_position.y < centro_y - 10:
				dir = 1
			elif global_position.y > centro_y + 10:
				dir = -1
		elif pelota.velocity.x > 0:
			var target_y = pelota.global_position.y + offset_aleatorio
			if global_position.y < target_y - 15:
				dir = 1
			elif global_position.y > target_y + 15:
				dir = -1
	else:
		if Input.is_action_pressed("ui_up"):
			dir -= 1
		if Input.is_action_pressed("ui_down"):
			dir += 1
			
	velocity.y = dir * velocidad
	velocity.x = 0 # Prohibido moverse a la izquierda/derecha
	
	move_and_slide()
	
	global_position.x = pos_x
