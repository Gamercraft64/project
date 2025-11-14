extends Node2D
const bullet_scene = preload("res://scene/bullet.tscn")

func _process(delta: float) -> void:
	_look_at_mouse()
	_shoot()


func _look_at_mouse():
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)


func _shoot():
	if Input.is_action_just_pressed("shoot"):
		var bullet = bullet_scene.instantiate()
		bullet.global_rotation = self.global_rotation
		bullet.global_position = $gun/Marker2D.global_position
		get_parent().add_child(bullet)
		
		
