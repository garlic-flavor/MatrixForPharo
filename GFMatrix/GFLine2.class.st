Class {
	#name : #GFLine2,
	#superclass : #Object,
	#instVars : [
		'start',
		'end',
		'visible'
	],
	#category : #GFMatrix
}

{ #category : #'as yet unclassified' }
GFLine2 class >> start: s end: e [
	^ self new
		start: s;
		end: e;
		yourself
]

{ #category : #accessing }
GFLine2 >> at: a [
	^ start + (self direction * a)
]

{ #category : #'as yet unclassified' }
GFLine2 >> croppedBy: rect [
	|side p1 p2 length ns ne|
	p1 := nil.
	p2 := nil.
	side := rect topSide.
	(self directionIsCrossedWith: side) ifTrue: [
		p2 := p1.
		p1 := self crossPointWith: side.
	].
	side := rect leftSide.
	(self directionIsCrossedWith: side) ifTrue: [
		p2 := p1.
		p1 := self crossPointWith: side.
	].
	side := rect bottomSide.
	(self directionIsCrossedWith: side) ifTrue: [
		p2 := p1.
		p1 := self crossPointWith: side.
	].
	side := rect rightSide.
	(self directionIsCrossedWith: side) ifTrue: [
		p2 := p1.
		p1 := self crossPointWith: side.
	].
	p2 ifNil: [
		visible := false.
		^ self.
	].

	p2 < p1 ifTrue: [ |tmp|
		tmp := p1.
		p1 := p2.
		p2 := tmp
	].
	length := self length.
	length < p1 ifTrue: [
		visible := false.
		^ self
	].
	ns := 0 < p1 ifTrue: [ self at: p1 ] ifFalse: [ start ].
	p2 < 0 ifTrue: [
		visible := false.
		^ self
	].
	ne := p2 < length ifTrue: [ self at: p2 ] ifFalse: [ end ].
	start := ns.
	end := ne.
]

{ #category : #'as yet unclassified' }
GFLine2 >> crossPointWith: line [
	|dir distance d1 d2 c1 c2 s1 s2 v|
	distance := start distanceTo: line start.
	distance = 0 ifTrue: [ ^ 0 ].
	dir := (line start - start) / distance.
	
	d1 := self direction.
	d2 := line direction.

	c1 := d1 dotProduct: dir.
	c2 := d2 dotProduct: dir * -1.
	s1 := d1 crossProduct: dir.
	s2 := d2 crossProduct: dir.
	v := (c1 * s2) + (s1 * c2).
	^ v = 0 ifTrue: [ 0 ] ifFalse: [ (distance * s2) / v ].
]

{ #category : #accessing }
GFLine2 >> direction [
	^ (end - start) normalized
]

{ #category : #'as yet unclassified' }
GFLine2 >> directionIsCrossedWith: line [
	|dir v1 v2 c1 c2|
	dir := end - start.
	v1 := line start - start.
	v2 := line end - start.
	c1 := v1 crossProduct: dir.
	c2 := dir crossProduct: v2.
	^ 0 <= (c1 * c2)

]

{ #category : #accessing }
GFLine2 >> end [

	^ end
]

{ #category : #accessing }
GFLine2 >> end: anObject [

	end := anObject
]

{ #category : #accessing }
GFLine2 >> length [
	^ start distanceTo: end
]

{ #category : #accessing }
GFLine2 >> start [

	^ start
]

{ #category : #accessing }
GFLine2 >> start: anObject [

	start := anObject
]

{ #category : #accessing }
GFLine2 >> visible [

	^ visible ifNil: [ visible := true ]
]

{ #category : #accessing }
GFLine2 >> visible: anObject [

	visible := anObject
]
