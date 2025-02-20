extends AnimatableBody2D

@export var _type: Creature


func _ready() -> void:
	$Sprite.texture = _type.sprite
	$MusicPlayer.stream = _type.music
	$MusicPlayer.play()
