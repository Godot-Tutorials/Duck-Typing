extends Node2D

var animal = Animal.new()
var duck = Duck.new()
var circle = Circle.new()


func _ready():
	letItFly(animal)
	letItFly(duck)
	letItFly(circle)
	# letItFly(5)
	
	# These will work, fly method will be called
	animalFlies(animal)
	animalFlies(duck)
	
	# This doesn't go through, throws error in Godot Editor
	# animalFlies(Circle.new()) # Error, Doesnt match function argument type,
	
	# This will run, throws an error when you try to use fly method in the function
	# animalFlies(circle) # Error, Pass in Null Value, Null doesn't Fly lol
	
	# Doesn't escape our if statement safety check!
	animalFliesSafely(circle) # Object class circle is casted/turned into a null value

# No Type Safety
func letItFly(flyingObject):
	flyingObject.fly()


# With Type Safety
func animalFlies(animalObject: Animal):
	animalObject.fly() # comes with auto complete


# Check for the objects casted as Nulls
func animalFliesSafely(animalObject: Animal):
	
	# Option 1
	if animalObject == null:
		print('object/value does not fly')
		return
	
	# Option 2
	if (animalObject is Animal) == false:
		print('Animal Class not part of Inheritance Chain')
		return
	
	# Do whatever you want, you're an animal!
	print('continue on ;)')
