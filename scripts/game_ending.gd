extends Control

@onready var score = $VBoxContainer/score as Label

# Called when the node enters the scene tree for the first time.
func _ready():
	score.text = str("Sua pontuação foi: %d" % Globals.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_btn_pressed():
	get_tree().change_scene_to_file("res://levels/level1.tscn")
	Globals.score = 0

func _on_exit_btn_pressed():
	get_tree().quit()
