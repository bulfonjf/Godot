extends KinematicBody2D

var Velocidad = 100
var MovimientoVertical = 0
var MovimientoHorizontal = 0
const LimiteMovimiento_Vertical = 2000
const LimiteMovimiento_Horizontal = 2000
var Movimiento = Vector2() 


#func _process(delta):
#	move_local_x(Velocidad*delta)
#	if(self.position.y > 1  && self.position.y <= get_viewport_rect().size.y):
#		move_local_y(MovimientoVertical*delta)
#	else:
#		if(self.position.y < 1): 
#			move_local_y(0) #Bounce off top
#			MovimientoVertical = 0
#	 if(self.position.y > get_viewport_rect().size.y):
#			move_local_y(0) #Bounce off bottom
#			MovimientoVertical = 0
	
#func _input(event):
#
#	if(event.is_action("Jugador_Arriba")):
#		if(MovimientoVertical >= -LimiteMovimiento_Vertical):
#			MovimientoVertical = -128
#			move_local_y(MovimientoVertical)
#	if(event.is_action("Jugador_Abajo")):
#		if(MovimientoVertical <= LimiteMovimiento_Vertical):
#			MovimientoVertical = 128
#			move_local_y(MovimientoVertical)
#	if(event.is_action("Jugador_Derecha")):
#		if(MovimientoVertical >= -LimiteMovimiento_Vertical):
#			MovimientoHorizontal = 128
#			move_local_x(MovimientoHorizontal)
#	if(event.is_action("Jugador_Izquierda")):
#		if(MovimientoVertical <= LimiteMovimiento_Vertical):
#			MovimientoHorizontal = -128
#			move_local_x(MovimientoHorizontal)
#

func cartesian_to_isometric(vector):
	return Vector2(vector.x - vector.y, (vector.x + vector.y) / 2)
func _input(event):
	var Direccion = Vector2()
	var Movimiento2
	if(event.is_action("Jugador_Arriba")):
		if(MovimientoVertical >= -LimiteMovimiento_Vertical):
			Direccion -= Vector2(0, 1)
			
	if(event.is_action("Jugador_Abajo")):
		if(MovimientoVertical <= LimiteMovimiento_Vertical):
			Direccion += Vector2(0, 1)
	if(event.is_action("Jugador_Derecha")):
		if(MovimientoVertical >= -LimiteMovimiento_Horizontal):
			Direccion += Vector2(1, 0)
	if(event.is_action("Jugador_Izquierda")):
		if(MovimientoVertical <= LimiteMovimiento_Horizontal):
			Direccion -= Vector2(1, 0)
	
	Movimiento = Direccion.normalized() * Velocidad
	Movimiento2 = cartesian_to_isometric(Movimiento)
	move_and_collide(Movimiento2) 
	


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
