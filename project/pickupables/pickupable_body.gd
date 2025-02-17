class_name PickupableBody
extends CharacterBody2D

@export var type: Pickupable


func _ready() -> void:
	$Sprite.texture = type.sprite
