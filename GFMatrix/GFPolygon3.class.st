"
open or closed polygon.
"
Class {
	#name : #GFPolygon3,
	#superclass : #Object,
	#instVars : [
		'vertices',
		'local'
	],
	#category : #GFMatrix
}

{ #category : #shapes }
GFPolygon3 class >> circle [
	^ self new
		vertices: (self circleVertices: 30);
		yourself.
]

{ #category : #'as yet unclassified' }
GFPolygon3 class >> circleVertices: density [
	|vert step|
	vert := OrderedCollection new: density.
	step := Float pi * 2 / (density - 1).
	0 to: density do: [ :i |
		vert add: (GFVector3 x: (i * step) cos y: (i * step) sin z: 0.0).
	].
	^ vert
]

{ #category : #accessing }
GFPolygon3 >> local [

	^ local ifNil: [ local := GFMatrix4x4 identity ]
]

{ #category : #accessing }
GFPolygon3 >> local: anObject [

	local := anObject
]

{ #category : #accessing }
GFPolygon3 >> vertices [

	^ vertices ifNil: [ vertices := OrderedCollection new ]
]

{ #category : #accessing }
GFPolygon3 >> vertices: anObject [

	vertices := anObject
]
