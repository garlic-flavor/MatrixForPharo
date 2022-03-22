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
