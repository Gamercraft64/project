extends Control


func _ready() -> void:
	hide()

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func _game_over():
	show()
	get_tree().paused = true
