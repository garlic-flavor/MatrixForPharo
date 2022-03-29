Class {
	#name : #GFFishEye,
	#superclass : #GFCamera,
	#instVars : [
		'lensCenter',
		'extraAngle'
	],
	#category : #GFMatrix
}

{ #category : #arithmetic }
GFFishEye >> * v [
	|pos np dot rotateAxis angle|
	pos := self m * v.
	np := pos normalized.
	dot := np dot: self lensCenter.
	0 < dot ifTrue: [ ^ self viewport * pos ].
	rotateAxis := np cross: self lensCenter.
	angle := rotateAxis length * self extraAngle.
	pos := pos rotate: angle axis: rotateAxis normalized.

	^ self viewport * pos
]

{ #category : #accessing }
GFFishEye >> extraAngle [

	^ extraAngle ifNil: [
		extraAngle := (Float halfPi - (12.0 / self focalLength) arcTan)
	]
]

{ #category : #accessing }
GFFishEye >> extraAngle: anObject [

	extraAngle := anObject
]

{ #category : #accessing }
GFFishEye >> lensCenter [

	^ lensCenter ifNil: [ lensCenter := (GFVector3 z: -1) ]
]

{ #category : #accessing }
GFFishEye >> lensCenter: anObject [

	lensCenter := anObject
]
