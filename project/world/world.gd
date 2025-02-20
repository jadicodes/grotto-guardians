extends Node2D

var level: int = 0
var current_state: int = 0

enum state {
	NONE,
	ROCKY,
	BUZZ,
	BERRY,
	CHORDS,
}


func _change_state(new_state):
	current_state = new_state
	match current_state:
		state.NONE:
			pass
		state.ROCKY:
			pass
		state.BUZZ:
			pass
		state.BERRY:
			pass
		state.CHORDS:
			pass


func _on_guardian_leveled_up() -> void:
	level += 1
	_change_state(level)
