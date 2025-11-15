extends Node2D
@export var speed = 500.00
@export var damage = 5
var motion = Vector2()



func _process(delta: float) -> void:
	_move(delta)


func _move(delta):
	global_position += Vector2(1,0).rotated(global_rotation) * speed * delta


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		area._take_damage(damage)
		queue_free()
