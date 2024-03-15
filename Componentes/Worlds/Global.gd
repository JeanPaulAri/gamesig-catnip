extends Node

var spawnPoint = Vector2(0,0)
var strength: int = 0
var agility: int = 0
var aim: int = 0
# Called when the node enters the scene tree for the first time.

func updateSpawn(newPoint):
	spawnPoint = newPoint
	
	
func updateStats(newStrength, newAgility, newAim):
	strength = newStrength
	agility = newAgility
	aim = newAim
	
