extends KinematicBody2D

var motion = Vector2()

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var Player = get_parent().get_node("Player")
	position += (Player.position - position) / 50
	look_at(Player.position)
	move_and_collide(motion)

func spawn():
	var rand = RandomNumberGenerator.new()
	var enemyscene = load("res://Enemy.tscn")

	var screen_size = get_viewport().get_visible_rect().size

	var enemy = enemyscene.instance()
	rand.randomize()
	var x = rand.randf_range(0, screen_size.x)

	rand.randomize()
	var y = rand.randf_range(0, screen_size.y)
	enemy.position.y = y
	enemy.position.x = x
	add_child(enemy)


func _on_Area2D_body_entered(body):
	if "Bullet" in body.name:
		spawn()
		queue_free()
