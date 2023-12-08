extends Area2D

#func _ready():
	#pass

func _process(_delta):
	#position.x += 0.3
	rotation_degrees += 1

func _on_body_entered(_main):
	queue_free()
	#pass






