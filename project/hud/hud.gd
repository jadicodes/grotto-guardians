extends Control

signal leveled_down


func _process(_delta: float) -> void:
	$HungerBar.value = $HungerTimer.time_left
	$ThirstBar.value = $ThirstTimer.time_left


func _on_guardian_ate_food() -> void:
	$HungerTimer.start()


func _on_hunger_timer_timeout() -> void:
	emit_signal("leveled_down")
	$HungerTimer.start()


func _on_thirst_timer_timeout() -> void:
	emit_signal("leveled_down")
	$ThirstTimer.start()


func _on_guardian_drank() -> void:
	$ThirstTimer.start()
