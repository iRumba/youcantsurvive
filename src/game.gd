extends Node2D

signal player_left

func _input(event):
    if event.is_action_pressed("turn_left") && !event.is_action_pressed("turn_right"):
        $player.turn(1)
    elif event.is_action_pressed("turn_right") && !event.is_action_pressed("turn_left"):
        $player.turn(2)
        
func _process(delta):
    processPlayerActions()
    
func processPlayerActions():
#    return Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left")
    if Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
        $player.setMoving(1)
    elif Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left"):
        $player.setMoving(2)
    else:
        $player.stopMoving()
        
    
#        return true
#    return false