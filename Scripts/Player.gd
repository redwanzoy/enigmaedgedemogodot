extends KinematicBody2D

var speed = 500
var max_speed = 150
var gravity = 380
var friction = 0.5
var jump = 250
var resistance = 0.7
var velocity = Vector2.ZERO
var spring = - 600
var canPick = true

#PortalIntialization
var portal_id = 0

onready var sprite = $Sprite
onready var anim = $AnimationPlayer





func _ready():
	pass


func _physics_process(delta):
	var movement_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if movement_x != 0:
		anim.play("run")
		velocity.x += movement_x * speed * delta
		velocity.x = clamp(velocity.x, -max_speed, max_speed)
		sprite.flip_h = movement_x <0
	
	if is_on_floor():
		if movement_x == 0:
			velocity.x = lerp(velocity.x, 0, friction)
			anim.play("idle")
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y -= jump
			anim.play("jump")
	else:
		if movement_x == 0:
			anim.play("jump")
			velocity.x = lerp(velocity.x, 0 , resistance)
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)



func _on_Spring_body_entered(body):
	velocity.y = spring

func Teleport(area):
	for portal in get_tree().get_nodes_in_group("portal"):
		if portal != area: 
			if(portal.id == area.id):
				if(!portal.lockPortal):
					area.LockedPortal()
					global_position = portal.global_position



func _on_hitBox_area_entered(area):
	if(area.is_in_group("portal")):
		if(!area.lockPortal):
			Teleport(area)



#deadfunc
func _on_Enemy_dead():
	queue_free()

func _on_EnemyBat_dead():
	queue_free()
