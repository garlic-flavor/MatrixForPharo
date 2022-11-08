Class {
	#name : #GFSquare3,
	#superclass : #GFVertex,
	#category : #GFMatrix
}

{ #category : #'instance creation' }
GFSquare3 class >> new: size x: x y: y [
	^ self new
		vertices: (self squareVerticesX: x y: x size: size)
]

{ #category : #drawing }
GFSquare3 >> drawOn: canvas [
	canvas drawPolygon3: self
]
