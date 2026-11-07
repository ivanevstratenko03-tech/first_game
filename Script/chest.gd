extends Area2D

@export var animated_sprite: AnimatedSprite2D
@export var reward_coins: int = 10

var is_opened: bool = false

func _ready() -> void:
	animated_sprite.play("idle")
	



func _on_body_entered(body: Node2D) -> void:
	if body is Player and not is_opened:
		open_chest(body)
		
		
func open_chest(player: Player) -> void:
	is_opened = true
	await get_tree().create_timer(1.0).timeout
	player.coins += reward_coins
	animated_sprite.play("open")
	print("Сундук відчинено! Нагорода отримана!")
	
