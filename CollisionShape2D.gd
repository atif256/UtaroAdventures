#extends CollisionShape2D


#signal collected

#func _on_Area2D_body_entered(body):
	#if body.is_in_group("main_character"):
		#emit_signal("collected")
		#queue_free()  # Destroy the item
