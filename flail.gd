extends RigidBody2D

const OSCILLATOR_FACTOR = 15
const FRICTION_FACTOR = 0.002
const SPRING_OFFSET = 150

var player
var string

func _ready():
	player = get_parent().get_node('player_kb')
	string = get_parent().get_node('string')

func _physics_process(delta):
	# Vectors and distances
	var relative_position = position - player.position
	var elongation = abs(relative_position.length() - SPRING_OFFSET)
	var direction = relative_position.normalized()
	var velocity = linear_velocity.length()
	var moving_direction = linear_velocity.normalized()
	# Reset forces
	applied_force = Vector2(0, 0)
	# Harmonic oscillator with offset center
	if (relative_position.length() >= SPRING_OFFSET):
		add_force(Vector2(0, 0), - direction * OSCILLATOR_FACTOR * elongation)
	# Friction
	add_force(Vector2(0, 0), - moving_direction * FRICTION_FACTOR * velocity * velocity)
	
	update_string()
	
func update_string():
	# Update string ends
	string.points[0] = position
	string.points[1] = player.position

