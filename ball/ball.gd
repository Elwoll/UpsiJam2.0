extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var bounce_factor
var numbersBalls = 4

var out = 1;

# Called when the node enters the scene tree for the first time.
#func _ready():
#	scale = Vector2(.5, .5)

func init(var style):
	scale_ball(.5)
	if style == 0:
		style1()
	elif style == 1:
		style1()
	elif style == 2:
		style2()
	elif style == 3:
		style3()


func scale_ball(fac):
	$Sprite.scale *= Vector2(fac, fac)
	$CollisionShape2D.scale *= Vector2(fac, fac)

func style0():
#	print("heavy ball")
	$Sprite.frame = 0
	weight = 100

func style1():
#	print("low bounce ball")
	$Sprite.frame = 1
	bounce_factor = .1

func style2():
#	print("medium bounce ball")
	$Sprite.frame = 2
	bounce_factor = .5

func style3():
#	print("high bounce ball")
	$Sprite.frame = 3
	bounce_factor = .9

func _on_VisibilityNotifier2D_screen_exited() -> void:
	if (position.x > get_viewport().size.x / 2):
		get_parent().get_parent().score1 += 1
	elif (position.x < get_viewport().size.x / 2):
		get_parent().get_parent().score2 += 1;
#	var foo = get_tree().get_root()
	queue_free()
