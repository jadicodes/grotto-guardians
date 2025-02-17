class_name Pickupable
extends Resource

@export_enum("Food", "Drink") var type

@export var sprite: CompressedTexture2D
@export var picked_up_sprite: CompressedTexture2D


func get_type() -> int:
	return type


func get_sprite() -> CompressedTexture2D:
	return picked_up_sprite
