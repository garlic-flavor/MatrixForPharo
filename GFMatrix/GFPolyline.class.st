Class {
	#name : #GFPolyline,
	#superclass : #GFVertex,
	#instVars : [
		'indices'
	],
	#category : #GFMatrix
}

{ #category : #'as yet unclassified' }
GFPolyline class >> cube [
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
GFPolyline class >> roomA: numLines [
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
GFPolyline >> indices [

	^ indices ifNil: [ indices := OrderedCollection new ]
]

{ #category : #accessing }
GFPolyline >> indices: anObject [

	indices := anObject
]
