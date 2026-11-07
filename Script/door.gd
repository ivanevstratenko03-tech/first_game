extends Area2D

@export var animated_sprite: AnimatedSprite2D
@export var door_collision: CollisionShape2D

var is_opened: bool = false


func _ready() -> void:
	animated_sprite.play("idle")


func _on_body_entered(body: Node2D) -> void:
	print("До дверей підійшов: ", body.name)

	if body is Player and not is_opened:
		open_door()


func open_door() -> void:
	is_opened = true
	await get_tree().create_timer(0.5).timeout
	animated_sprite.play("open")
	door_collision.set_deferred("disabled", true)

	print("Двері відчинено!")
		

   
	
