extends Area2D

func _ready():
	pass

func _process(delta):
	#position.x += 0.3
	rotation_degrees +=1

func _on_body_entered(main):
	queue_free()
	#pass






