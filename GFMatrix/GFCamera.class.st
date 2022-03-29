"
focal length based projection.
"
Class {
	#name : #GFCamera,
	#superclass : #GFWorld,
	#instVars : [
		'focalLength',
		'width',
		'height',
		'near',
		'far'
	],
	#category : #GFMatrix
}

{ #category : #accessing }
GFCamera >> far [

	^ far ifNil: [ far := 1000 ]
]

{ #category : #accessing }
GFCamera >> far: anObject [

	far := anObject.
	self projection: nil
]

{ #category : #accessing }
GFCamera >> focalLength [

	^ focalLength
]

{ #category : #accessing }
GFCamera >> focalLength: anObject [

	focalLength := anObject.
	self projection: nil
]

{ #category : #'instance creation' }
GFCamera >> from: pos [
	self camera: (GFMatrix4x4 lookAt: GFVector3 zero from: pos up: GFVector3 y)
]

{ #category : #'instance creation' }
GFCamera >> from: pos to: to [
	self camera: (GFMatrix4x4 lookAt: to from: pos up: GFVector3 y)
]

{ #category : #accessing }
GFCamera >> height [

	^ height
]

{ #category : #accessing }
GFCamera >> height: anObject [

	height := anObject.
	self projection: nil.
	self viewport: nil
]

{ #category : #accessing }
GFCamera >> near [

	^ near ifNil: [ near := 1 ]
]

{ #category : #accessing }
GFCamera >> near: anObject [

	near := anObject.
	self projection: nil.
]

{ #category : #accessing }
GFCamera >> projection [
	^ projection ifNil: [|angle asp|
		angle := (12.0 / self focalLength) arcTan * 2.
		asp := self width / self height.
		projection := GFMatrix4x4 perspectiveFovyRad: angle asp: asp near: self near far: self far
	]
]

{ #category : #accessing }
GFCamera >> viewport [
	^ viewport ifNil: [ viewport := GFViewport width: self width height: self height ]
]

{ #category : #accessing }
GFCamera >> width [

	^ width
]

{ #category : #accessing }
GFCamera >> width: anObject [

	width := anObject.
	self projection: nil.
	self viewport: nil
]
