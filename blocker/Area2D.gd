extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hit = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	hit += 1
	if hit == 2:
		get_parent().modulate.a = .7
	if hit == 3:
		get_parent().modulate.a = .5
	if hit == 4:
		get_parent().modulate.a = .3
	if hit == 5:
		get_parent().queue_free()
	pass # Replace with function body.
