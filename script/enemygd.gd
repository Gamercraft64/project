extends Area2D

@export var health = 10
@export var speed = 50.00
@export var damage = 2
var damaging = false
func _move(delta):
	var player = get_tree().get_first_node_in_group("player")
	if player:
		look_at(player.global_position)
		position += Vector2(1,0).rotated(rotation) * speed * delta
		$AnimatedSprite2D.global_rotation = 0
		$AnimatedSprite2D.play("default")
		if player.global_position < self.global_position:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false


func _take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()


func _physics_process(delta: float) -> void:
	_move(delta)




func _on_timer_timeout() -> void:
	damaging = false


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and damaging == false:
		body.take_damage(damage)
		damaging = true
		$Timer.start()
