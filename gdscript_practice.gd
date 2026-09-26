extends Node2D


# Змінні для завдання 5
var current_level: int = 1
var max_level: int = 5
var experience_to_next_level: int = 100


func _ready() -> void:
 # Завдання 1
 knight_defense()

 # Завдання 2
 hero_inventory()

 # Завдання 3
 check_stamina()

 # Завдання 4
 print(calculate_reward(100, 1.5))

 # Завдання 5
 level_up(120)


# Завдання 1 — Захист лицаря
func knight_defense() -> void:
 var base_health: int = 100
 var armor: int = 25
 var incoming_damage: int = 39

 var final_health: int = int(base_health - (incoming_damage - armor / 2.0))

 print(final_health)


# Завдання 2 — Інвентар героя
func hero_inventory() -> void:
 var inventory: Array[String] = [
  "Зілля мани",
  "Сувій вогню",
  "Іржавий ключ",
  "Золоте яблуко"
 ]

 for i in range(inventory.size()):
  print(i + 1, ". ", inventory[i])


# Завдання 3 — Витривалість героя
func check_stamina() -> void:
 var stamina: int = 15

 if stamina > 70:
  print("Герой повний сил і може здійснити супер-ривок!")
 elif stamina >= 20:
  print("Герой може бігти зі звичайною швидкістю.")
 else:
  print("Герой виснажений! Біг неможливий.")


# Завдання 4 — Множник золота
func calculate_reward(base_gold: int, multiplier: float) -> int:
 var final_gold: int = int(base_gold * multiplier)

 return final_gold


# Завдання 5 — Підвищення рівня
func level_up(experience: int) -> void:
 if experience >= experience_to_next_level and current_level < max_level:
  current_level += 1
  print("Новий рівень: ", current_level)
 else:
  print("Недостатньо досвіду")
