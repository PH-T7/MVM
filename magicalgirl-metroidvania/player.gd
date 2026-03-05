extends CharacterBody2D


const SPEED_MIN = 300.0
const SPEED_MAX = 400.0
const ACCEL = 50.0
const JUMP_VELOCITY = -450.0
const MAX_FALL_SPEED = 900.0
const COYOTE_TIME: float = .1
const  SHORT_HOP: float = .5

#var gravity: int = ProjectSettings
var animation: String

var reset_postion: Vector2
#
var event: bool

var abilities: Array[StringName]
var double_jump: bool
var prev_on_floor: bool
var airtime: float = 0
var speed: float = SPEED_MIN

func _ready() -> void:
	on_enter()

func _physics_process(delta: float) -> void:
	if event:
		return
		
	if not is_on_floor():
		 velocity.y = min(velocity.y + gravity * delta, MAX_FALL_SPEED)
		 airtime += delta
	elif not prev_on_floor and &"double_jump" in abilities:
		
		double_jump = true
		airtime = 0
	
	var on_floor_ct: bool = is_on_floor()
		
		
