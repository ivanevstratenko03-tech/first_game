extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		print("Увага! Гравець наступив на шипи! Отримання періодичної шкоди!")
		
		
func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		print("Гравець залишив небезпечну зону. Загрозу усунено.")
