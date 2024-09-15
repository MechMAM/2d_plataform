extends Area2D

@export var cena_a_carregar = ""

func _on_body_entered(body):
	if body.is_in_group("Player"):
		Globals.score += 10
		get_tree().change_scene_to_file(cena_a_carregar)
