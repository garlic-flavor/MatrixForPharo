Class {
	#name : #GFChess,
	#superclass : #GFVertex,
	#instVars : [
		'squares'
	],
	#category : #GFMatrix
}

{ #category : #'instance creation' }
GFChess class >> new: size w: w h: h [
	|squares|
	squares := OrderedCollection new: ((w // 2 + 1) * h).
	0 to: (h - 1) do: [ : y |
		0 to: (w - 1) do: [ :x |
			(y % 2) = (x % 2) ifTrue: [
				squares add: (self squareVerticesX: (size * x) y: (size * y) size: size).
			]
		]
	].
	^ self new
		squares: squares;
		yourself
]

{ #category : #'instance creation' }
GFChess class >> newShifted: size w: w h: h [
	|squares|
	squares := OrderedCollection new: ((w // 2 + 1) * h).
	0 to: (h - 1) do: [ : y |
		0 to: (w - 1) do: [ :x |
			(y % 2) ~= (x % 2) ifTrue: [
				squares add: (self squareVerticesX: (size * x) y: (size * y) size: size).
			]
		]
	].
	^ self new
		squares: squares;
		yourself
]

{ #category : #accessing }
GFChess >> squares [

	^ squares ifNil: [ squares := OrderedCollection new ]
]

{ #category : #accessing }
GFChess >> squares: anObject [

	squares := anObject
]
