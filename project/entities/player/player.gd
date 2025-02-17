class_name Player
extends CharacterBody2D

signal picked_up

const SPEED = 300.0

var has_food: bool = false
var has_drink: bool = false

# Getters

func get_has_food() -> bool:
	return has_food


func get_has_drink() -> bool:
	return has_drink


# Clears anything out of player's inventory

func clear_inventory() -> void:
	$PickedUpSprite.texture = null
	has_food = false
	has_drink = false


# Manages player input

func _physics_process(_delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * SPEED
	
	if Input.is_action_just_pressed("interact"):
		_pick_up()

	move_and_slide()


func _pick_up():
	emit_signal("picked_up")


func _on_pick_up_detector_body_entered(body: Node2D) -> void:
	if body is PickupableBody:
		$PickedUpSprite.texture = body.type.picked_up_sprite
		if body.type.type == 0: # Food
			has_food = true
		if body.type.type == 1: # Drink
			has_drink = true
