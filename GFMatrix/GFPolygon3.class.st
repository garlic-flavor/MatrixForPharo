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
