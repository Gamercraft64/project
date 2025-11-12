extends CharacterBody2D
@export var speed = 100.00


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_movement()


func _movement():
	var motion = Vector2()
	if Input.is_action_pressed("right"):
		motion.x += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	if Input.is_action_pressed("up"):
		motion.y -=1
	if Input.is_action_pressed("down"):
		motion.y += 1
	motion = motion.normalized()
	velocity = motion * speed
	move_and_slide()
