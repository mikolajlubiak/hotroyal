extends KinematicBody2D

export (int) var speed = 200
const bulletPath = preload('res://Bullet.tscn')
func shoot():
	var bullet = bulletPath.instance()
	get_parent().add_child(bullet)
	bullet.position = $Position2D.position
	


var velocity = Vector2()

func get_input():
	look_at(get_global_mouse_position())
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
