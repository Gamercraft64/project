extends CharacterBody2D
@export var speed = 100.00
@onready var animation = $AnimatedSprite2D
@export var health = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_movement(delta)


func _movement(delta):
	var motion = Vector2()
	if Input.is_action_pressed("right"):
		motion.x += 1
		animation.play("walk")
		animation.flip_h = false
	if Input.is_action_pressed("left"):
		motion.x -= 1
		animation.play("walk")
		animation.flip_h = true
	if Input.is_action_pressed("up"):
		motion.y -=1
		animation.play("walk")
	if Input.is_action_pressed("down"):
		motion.y += 1
		animation.play("walk")
	motion = motion.normalized()
	velocity = motion * speed
	move_and_slide()


func _on_animated_sprite_2d_animation_finished() -> void:
	animation.frame = 0


func take_damage(damage):
	health -= damage 
	if health <= 0:
		$"game over"._game_over()
