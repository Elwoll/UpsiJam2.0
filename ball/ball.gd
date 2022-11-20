extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var size_pos = get_viewport().size.x

var bounce_factor
var numbersBalls = 4

var out = 1;

# Called when the node enters the scene tree for the first time.
#func _ready():
#	scale = Vector2(.5, .5)

func init(var style):
	scale_ball(.5)
	.set_bounce(.5)
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
	size_pos = get_viewport().size.x
	if (position.x < size_pos / 2):
		var value = Globals.get("score1") + 1;
		Globals.set("score1", value);
	elif (position.x > size_pos / 2):
		var value = Globals.get("score2") + 1;
		Globals.set("score2", value);
#	var foo = get_tree().get_root()
	queue_free()


func _on_Control_resized():
	print(get_viewport())
	size_pos = .get_viewport().size.x
