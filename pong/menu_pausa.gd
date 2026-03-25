extends CanvasLayer

var modo_cpu = false

func _ready():
	get_tree().paused = true
	visible = true
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = not get_tree().paused
		visible = get_tree().paused

func _on_btn_play_pressed():
	get_tree().paused = false
	visible = false

func _on_btn_reiniciar_pressed():
	get_tree().paused = false
	visible = false
	$"%Puntos1".text = "0"
	$"%Puntos2".text = "0"
	$"%Pelota".puntos_p1 = 0
	$"%Pelota".puntos_p2 = 0
	get_parent().get_node("UI").tiempo_jugado = 0
	$"%Pelota".iniciar_saque(1)

func _on_btn_modo_pressed():
	modo_cpu = not modo_cpu
	$"%paleta_derecha".es_cpu = modo_cpu

	if modo_cpu:
		$"%BtnModo".text = "Modo: Vs Máquina"
	else:
		$"%BtnModo".text = "Modo: 1 vs 1"
