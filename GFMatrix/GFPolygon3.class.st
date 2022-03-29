"
open or closed polygon.
"
Class {
	#name : #GFPolygon3,
	#superclass : #GFVertex,
	#category : #GFMatrix
}

{ #category : #shapes }
GFPolygon3 class >> circle [
	^ self new
		vertices: (self circleVertices: 30);
		yourself.
]

{ #category : #shapes }
GFPolygon3 class >> square [
	^ self new
		vertices: (self squareVerticesX: 0 y: 0 size: 1);
		yourself
]
