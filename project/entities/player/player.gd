class_name Player
extends CharacterBody2D

signal picked_up

const SPEED = 300.0

var has_food: bool = false
var has_drink: bool = false

var _can_pick_up: bool = true 
var _pickupables_in_detector: Array[PickupableBody] = []


# Getters

func get_has_food() -> bool:
	return has_food


func get_has_drink() -> bool:
	return has_drink


# Clears anything out of player's inventory

func clear_inventory() -> void:
	$PickedUpSprite.texture = null
	_can_pick_up = true
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
	if _can_pick_up:
		if _pickupables_in_detector.size() != 0:
			$PickedUpSprite.texture = _pickupables_in_detector[0].type.picked_up_sprite
			if _pickupables_in_detector[0].type.type == 0: # Food
				has_food = true
				_can_pick_up = false
			if _pickupables_in_detector[0].type.type == 1: # Drink
				has_drink = true
				_can_pick_up = false


func _on_pick_up_detector_body_entered(body: Node2D) -> void:
	if body is PickupableBody:
		_pickupables_in_detector.append(body)


func _on_pick_up_detector_body_exited(body: Node2D) -> void:
	if body is PickupableBody:
		_pickupables_in_detector.erase(body)
