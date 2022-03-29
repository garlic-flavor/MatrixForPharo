Class {
	#name : #GFVertex,
	#superclass : #Object,
	#instVars : [
		'vertices',
		'local'
	],
	#category : #GFMatrix
}

{ #category : #'as yet unclassified' }
GFVertex class >> circleVertices: density [
	|vert step|
	vert := OrderedCollection new: density.
	step := Float pi * 2 / (density - 1).
	0 to: density do: [ :i |
		vert add: (GFVector3 x: (i * step) cos y: (i * step) sin z: 0.0).
	].
	^ vert
]

{ #category : #'as yet unclassified' }
GFVertex class >> cubeVertices: numLines [
	|step vert|
	step := 2.0 / (numLines - 1).
	vert := OrderedCollection new: numLines * 12.
	"roof - Z"
	0 to: (numLines - 1) do: [:i |
		vert add: (GFVector3 x: -1 y: 1 z: -1 + (step * i))
	].
	0 to: (numLines - 1) do: [ :i |
		vert add: (GFVector3 x: 1 y: 1 z: -1 + (step * i))
	].

	"floor - Z"
	0 to: (numLines - 1) do: [:i |
		vert add: (GFVector3 x: -1 y: -1 z: -1 + (step * i))
	].
	0 to: (numLines - 1) do: [ :i |
		vert add: (GFVector3 x: 1 y: -1 z: -1 + (step * i))
	].

	"roof - X"
	0 to: (numLines - 1) do: [:i |
		vert add: (GFVector3 x: -1 + (step * i) y: 1 z: -1)
	].
	0 to: (numLines - 1) do: [ :i |
		vert add: (GFVector3 x: -1 + (step * i) y: 1 z: 1)
	].
	"floor - X"
	0 to: (numLines - 1) do: [:i |
		vert add: (GFVector3 x: -1 + (step * i) y: -1 z: -1)
	].
	0 to: (numLines - 1) do: [ :i |
		vert add: (GFVector3 x: -1 + (step * i) y: -1 z: 1)
	].

	"pillar"
	0 to: (numLines - 1) do: [:i |
		vert add: (GFVector3 x: -1 y: -1 + (step * i) z: -1)
	].
	0 to: (numLines - 1) do: [ :i |
		vert add: (GFVector3 x: 1 y: -1 + (step * i) z: -1)
	].
	0 to: (numLines - 1) do: [:i |
		vert add: (GFVector3 x: -1 y: -1 + (step * i) z: 1)
	].
	0 to: (numLines - 1) do: [ :i |
		vert add: (GFVector3 x: 1 y: -1 + (step * i) z: 1)
	].

	^ vert
]

{ #category : #'as yet unclassified' }
GFVertex class >> squareVerticesX: x y: y size: size [
	^ {
		x@y@0.
		(x + size)@y@0.
		(x + size)@(y + size)@0.
		x@(y + size)@0
	}
	
]

{ #category : #'as yet unclassified' }
GFVertex >> attach [
	vertices := vertices collect: [ :vert |
		self local * vert
	].
	self local identity.
]

{ #category : #drawing }
GFVertex >> drawOn: canvas [
	^ self subclassResponsibility 
]

{ #category : #accessing }
GFVertex >> local [

	^ local ifNil: [ local := GFMatrix4x4 identity ]
]

{ #category : #accessing }
GFVertex >> local: anObject [

	local := anObject
]

{ #category : #accessing }
GFVertex >> vertices [

	^ vertices ifNil: [ vertices := OrderedCollection new ]
]

{ #category : #accessing }
GFVertex >> vertices: anObject [

	vertices := anObject
]
