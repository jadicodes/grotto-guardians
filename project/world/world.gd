extends Node2D

var level: int = 0
var current_state: int = 0
var _music_playing: bool = false
var _music_time: float = 0.0

var is_chord_out: bool = false

enum state {
	NONE,
	ROCKY,
	BUZZ,
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
			$AnimationPlayer.play("rocky_enters")
			for creature in $Creatures.get_children():
				if creature.type.creature_name == "Rocky":
					creature.show_creature(_music_time)
					_music_playing = true
				if creature.type.creature_name == "Buzzy":
					creature.hide_creature()
				if creature.type.creature_name == "Chord":
					creature.hide_creature()
		state.BUZZ:
			$AnimationPlayer.play("buzz_enters")
			for creature in $Creatures.get_children():
				if creature.type.creature_name == "Buzzy":
					creature.show_creature(_music_time)
				if creature.type.creature_name == "Chord":
					creature.hide_creature()
				if is_chord_out:
					$AnimationPlayer.play("chord_leaves")
		state.CHORDS:
			$AnimationPlayer.play("chord_enters")
			for creature in $Creatures.get_children():
				if creature.type.creature_name == "Chord":
					creature.show_creature(_music_time)
					is_chord_out = true


func _on_guardian_leveled_up() -> void:
	if level < 3:
		level += 1
		_change_state(level)


func _on_hud_leveled_down() -> void:
	level -= 1
	_change_state(level)
