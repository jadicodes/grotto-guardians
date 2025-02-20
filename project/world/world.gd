extends Node2D

var level: int = 0
var current_state: int = 0
var _music_playing: bool = false
var _music_time: float = 0.0

enum state {
	NONE,
	ROCKY,
	BUZZ,
	BERRY,
	CHORDS,
}


func _ready():
	for creature in $Creatures.get_children():
		creature.hide_creature()


func _process(delta: float) -> void:
	if _music_playing == true:
		_music_time = $Creatures/Rocky.get_music_time()


func _change_state(new_state):
	current_state = new_state
	match current_state:
		state.NONE:
			for creature in $Creatures.get_children():
				creature.hide_creature()
				_music_playing = false
		state.ROCKY:
			for creature in $Creatures.get_children():
				if creature.type.creature_name == "Rocky":
					creature.show_creature(_music_time)
					_music_playing = true
		state.BUZZ:
			for creature in $Creatures.get_children():
				if creature.type.creature_name == "Buzzy":
					creature.show_creature(_music_time)
		state.BERRY:
			for creature in $Creatures.get_children():
				if creature.type.creature_name == "Berry":
					creature.show_creature(_music_time)
		state.CHORDS:
			for creature in $Creatures.get_children():
				if creature.type.creature_name == "Chord":
					creature.show_creature(_music_time)


func _on_guardian_leveled_up() -> void:
	level += 1
	_change_state(level)
