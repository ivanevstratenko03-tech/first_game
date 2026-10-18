extends CharacterBody2D

# Состояния персонажа
enum State { IDLE, RUN, JUMP, FALL }

# Скорость движения и сила прыжка
const SPEED: float = 250.0
const JUMP_VELOCITY: float = -400.0

# Гравитация
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

# Текущее состояние
var current_state: State = State.IDLE

# Ссылка на анимированный спрайт
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


# Главная функция движения
func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	handle_jump()

	var direction: float = Input.get_axis("move_left", "move_right")
	handle_movement(direction)

	move_and_slide()

	handle_flip(direction)
	update_state(direction)
	play_animation()


# Гравитация
func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta


# Прыжок
func handle_jump() -> void:
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY


# Движение влево и вправо
func handle_movement(direction: float) -> void:
	if direction != 0.0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0.0, SPEED)


# Разворот персонажа
func handle_flip(direction: float) -> void:
	if direction > 0.0:
		animated_sprite.flip_h = false
	elif direction < 0.0:
		animated_sprite.flip_h = true


# Определение состояния
func update_state(direction: float) -> void:
	if not is_on_floor():
		if velocity.y < 0.0:
			current_state = State.JUMP
		else:
			current_state = State.FALL
	elif direction != 0.0:
		current_state = State.RUN
	else:
		current_state = State.IDLE


# Включение нужной анимации
func play_animation() -> void:
	var next_animation: String = ""

	match current_state:
		State.IDLE:
			next_animation = "idle"
		State.RUN:
			next_animation = "run"
		State.JUMP:
			next_animation = "jump"
		State.FALL:
			next_animation = "fall"

	if animated_sprite.animation != next_animation:
		animated_sprite.play(next_animation)
	elif not animated_sprite.is_playing():
		if current_state == State.IDLE or current_state == State.RUN:
			animated_sprite.play()
	

	
		
		
