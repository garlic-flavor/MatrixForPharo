"
convert GFVector3 to GFVector2
"
Class {
	#name : #GFWorld,
	#superclass : #Object,
	#instVars : [
		'projection',
		'camera',
		'local',
		'viewport',
		'm'
	],
	#category : #GFMatrix
}

{ #category : #arithmetic }
GFWorld >> * v [
	^ self viewport * (self m * v)
]

{ #category : #accessing }
GFWorld >> camera [

	^ camera
]

{ #category : #accessing }
GFWorld >> camera: anObject [

	camera := anObject.
	m := nil
]

{ #category : #accessing }
GFWorld >> local [

	^ local
]

{ #category : #accessing }
GFWorld >> local: anObject [

	local := anObject.
	m := nil.
]

{ #category : #accessing }
GFWorld >> m [

	^ m ifNil: [ m := self projection * self camera * self local ]
]

{ #category : #accessing }
GFWorld >> m: anObject [

	m := anObject
]

{ #category : #accessing }
GFWorld >> projection [

	^ projection
]

{ #category : #accessing }
GFWorld >> projection: anObject [

	projection := anObject.
	m := nil
]

{ #category : #accessing }
GFWorld >> viewport [

	^ viewport
]

{ #category : #accessing }
GFWorld >> viewport: anObject [

	viewport := anObject
]
