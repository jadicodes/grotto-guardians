extends AnimatableBody2D

@export var type: Creature


func _ready() -> void:
	$Sprite.texture = type.sprite
	$MusicPlayer.stream = type.music
	$MusicPlayer.play()


func show_creature(from_position: float = 0.0):
	$MusicPlayer.play(from_position)


func hide_creature():
	$MusicPlayer.stop()


func get_music_time():
	return $MusicPlayer.get_playback_position()
