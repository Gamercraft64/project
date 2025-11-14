extends Node2D
@export var speed = 500.00
var motion = Vector2()



func _process(delta: float) -> void:
	_move(delta)


func _move(delta):
	global_position += Vector2(1,0).rotated(global_rotation) * speed * delta
