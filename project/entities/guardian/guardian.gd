extends CharacterBody2D

signal ate_food
signal drank
signal leveled_up

@export var _guardian_type: GuardianType
var guardian_name: String
var current_state: int = 1

enum state {
	SAD,
	NEUTRAL,
	HAPPY
}


func _ready():
	$Sprite.texture = _guardian_type.sprite
	guardian_name = _guardian_type.name


func _on_player_detector_body_entered(body: Node2D) -> void:
	if body is Player:
		var _has_food: bool = body.get_has_food()
		var _has_drink: bool = body.get_has_drink()
		if _has_food:
			body.clear_inventory()
			emit_signal("ate_food")
		if _has_drink:
			body.clear_inventory()
			emit_signal("drank")


func _on_happiness_timer_timeout() -> void:
	# If cat is happy when timer runs out, emit level up signal, restart the timer 
	if current_state == 2:
		emit_signal("leveled_up")
	if current_state < 2:
		current_state += 1
	$HappinessTimer.start()


func _on_hud_leveled_down() -> void:
	if current_state > 0:
		current_state -= 1
		$HappinessTimer.start()
