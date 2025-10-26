extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area.get_collision_layer_value(3): #flammable body
		var chance_of_fire = ( randi() % 2 ) * -1
		print(chance_of_fire)
		if chance_of_fire:
			area.start_fire()
