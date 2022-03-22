"
convert GFVector3 to GFVector2.
(-1, 1, z) -> (0, 0)
(1, -1, z) -> (width, height)
"
Class {
	#name : #GFViewport,
	#superclass : #Object,
	#instVars : [
		'width',
		'height',
		'w2',
		'h2'
	],
	#category : #GFMatrix
}

{ #category : #'instance creation' }
GFViewport class >> width: w height: h [
	^ self new
		width: w;
		height: h;
		yourself
]

{ #category : #arithmetic }
GFViewport >> * v [
	^ ((v x + 1) * w2) @ (height - ((v y + 1) * h2))
]

{ #category : #accessing }
GFViewport >> height [

	^ height
]

{ #category : #accessing }
GFViewport >> height: anObject [

	height := anObject.
	h2 := anObject / 2
]

{ #category : #accessing }
GFViewport >> width [

	^ width
]

{ #category : #accessing }
GFViewport >> width: anObject [

	width := anObject.
	w2 := anObject / 2
]
