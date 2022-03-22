"
define polylines for GFCanvas3
"
Class {
	#name : #GFPolyline3,
	#superclass : #Object,
	#instVars : [
		'vertices',
		'indices',
		'local'
	],
	#category : #GFMatrix
}

{ #category : #'as yet unclassified' }
GFPolyline3 class >> circleVertices: density [
	|vert step|
	vert := OrderedCollection new: density.
	step := Float pi * 2 / (density - 1).
	0 to: density do: [ :i |
		vert add: (GFVector3 x: (i * step) cos y: (i * step) sin z: 0.0).
	]
]

{ #category : #'as yet unclassified' }
GFPolyline3 class >> cube [
	^ self new
		vertices: {
			GFVector3 x: -1 y: 1 z: 1.
			GFVector3 x: 1 y: 1 z: 1.
			GFVector3 x: 1 y: -1 z: 1.
			GFVector3 x: -1 y: -1 z: 1.
			GFVector3 x: -1 y: 1 z: -1.
			GFVector3 x: 1 y: 1 z: -1.
			GFVector3 x: 1 y: -1 z: -1.
			GFVector3 x: -1 y: -1 z: -1
		};
		indices: {
			1. 2. 2. 3. 3. 4. 4. 1.
			5. 6. 6. 7. 7. 8. 8. 5.
			1. 5. 2. 6. 3. 7. 4. 8
		};
		yourself
]

{ #category : #'as yet unclassified' }
GFPolyline3 class >> cubeVertices: numLines [
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
GFPolyline3 class >> roomA: numLines [
	|vert idx|
	vert := self cubeVertices: numLines.
	idx := OrderedCollection new: numLines * 2 * 8.
	"roof - Z"
	1 to: numLines do: [:i |
		idx
			add: i;
			add: i + numLines
	].

	"floor - Z"
	1 to: numLines do: [:i |
		idx
			add: i + (numLines * 2);
			add: i + (numLines * 3)
	].

	"roof - X"
	1 to: numLines do: [:i |
		idx
			add: i + (numLines * 4);
			add: i + (numLines * 5)
	].

	"floor - X"
	1 to: numLines do: [:i |
		idx
			add: i + (numLines * 6);
			add: i + (numLines * 7)
	].

	"wall E - yoko"
	1 to: numLines do: [ :i |
		idx
			add: i + (numLines * 8);
			add: i + (numLines * 9)
	].
	"wall N - yoko"
	1 to: numLines do: [ :i |
		idx
			add: i + (numLines * 8);
			add: i + (numLines * 10)
	].

	"wall E - tate"
	1 to: numLines do: [ :i |
		idx
			add: i + (numLines * 4);
			add: i + (numLines * 6)
	].	

	"wall N - tate"
	1 to: numLines do: [ :i |
		idx
			add: i;
			add: i + (numLines * 2)
	].	
	

	^ self new
		vertices: vert;
		indices: idx;
		yourself
]

{ #category : #accessing }
GFPolyline3 >> indices [

	^ indices ifNil: [ indices := OrderedCollection new ]
]

{ #category : #accessing }
GFPolyline3 >> indices: anObject [

	indices := anObject
]

{ #category : #accessing }
GFPolyline3 >> local [

	^ local ifNil: [ local := GFMatrix4x4 identity ]
]

{ #category : #accessing }
GFPolyline3 >> local: anObject [

	local := anObject
]

{ #category : #accessing }
GFPolyline3 >> vertices [

	^ vertices ifNil: [ vertices := OrderedCollection new ]
]

{ #category : #accessing }
GFPolyline3 >> vertices: anObject [

	vertices := anObject
]
