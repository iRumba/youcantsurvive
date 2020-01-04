extends KinematicBody2D

enum Directions{
    Left = 1,
    Right = 2    
}

enum MovingDirections {
    Front,
    Back,
    None
}

const GRAVITY = 980.0
const MAXSPEED = 250

var speed = 0
var velocity = Vector2()
var direction = Directions.Left

var flip = false

func _physics_process(delta):
    velocity.y += delta * GRAVITY
    var motion = velocity * delta
    var collision = move_and_collide(motion)
    $Sprite.set_flip_h(flip)
    if collision:
        move()
        
func move():
    velocity = Vector2()
    velocity.x = 1
        
    velocity = velocity * speed
    print(speed)
    move_and_slide(velocity)
    
func setMoving(direct: int):
    if direct == direction:
        speed = MAXSPEED
    else:
        speed = -MAXSPEED / 2
    
    if direction == Directions.Left:
        speed *= -1
    
func stopMoving():
    speed = 0
    
func turn(direct: int):
    if direct != direction:
        direction = direct
        flip = direction == Directions.Right