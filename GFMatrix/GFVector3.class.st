"
3 dimentional column-major Vector class. OpenGL style.

```
    | x |
v = | Y |
    | z |
```
"
Class {
	#name : #GFVector3,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'z'
	],
	#category : #GFMatrix
}

{ #category : #'instance creation' }
GFVector3 class >> x: x y: y z: z [
	^ self new
		x: x;
		y: y;
		z: z;
		yourself
]

{ #category : #adding }
GFVector3 >> * right [
	^ self class
		x: self x * right
		y: self y * right
		z: self z * right
]

{ #category : #adding }
GFVector3 >> *= right [
	self
		x: self x * right;
		y: self y * right;
		z: self z * right.
	^ right
]

{ #category : #arithmetic }
GFVector3 >> + right [
	^ (right class includesBehavior: GFVector3) ifTrue: [
		self addedVector: right
	] ifFalse: [
		self added: right
	]
]

{ #category : #'accumulator ops' }
GFVector3 >> += right [
	^ (right class includesBehavior: GFVector3) ifTrue: [
		self addVector: right
	] ifFalse: [
		self add: right
	]	
]

{ #category : #arithmetic }
GFVector3 >> - right [
	^ (right class includesBehavior: GFVector3) ifTrue: [
		self subtractedVector: right
	] ifFalse: [
		self subtracted: right
	]
]

{ #category : #arithmetic }
GFVector3 >> -= right [
	^ (right class includesBehavior: GFVector3) ifTrue: [
		self subVector: right
	] ifFalse: [
		self sub: right
	]
]

{ #category : #adding }
GFVector3 >> / right [
	^ self class
		x: self x / right
		y: self y / right
		z: self z / right
]

{ #category : #adding }
GFVector3 >> /= right [
	self
		x: self x / right;
		y: self y / right;
		z: self z / right.
	^ right
]

{ #category : #adding }
GFVector3 >> add: right [
	self
		x: self x + right;
		y: self y + right;
		z: self z + right.
	^ right
]

{ #category : #adding }
GFVector3 >> addVector: right [
	self
		x: self x + right x;
		y: self y + right y;
		z: self z + right z.
	^ right
]

{ #category : #adding }
GFVector3 >> added: right [
	^ self class
		x: self x + right
		y: self y + right
		z: self z + right
]

{ #category : #adding }
GFVector3 >> addedVector: right [
	^ self class
		x: self x + right x
		y: self y + right y
		z: self z + right z
]

{ #category : #'as yet unclassified' }
GFVector3 >> cross: r [
	^ self class
		x: (self y * r z) - (self z * r y)
		y: (self z * r x) - (self x * r z)
		z: (self x * r y) - (self y * r x)
]

{ #category : #accessing }
GFVector3 >> distance: r [
	|dx dy dz|
	dx := self x - r x.
	dy := self y - r y.
	dz := self z - r z.
	^ ((dx * dx) + (dy * dy) + (dz * dz)) sqrt
]

{ #category : #arithmetic }
GFVector3 >> dot: right [
	^ (self x * right x) + (self y * right y) + (self z * right z)
]

{ #category : #transforming }
GFVector3 >> interpolateTo: dest at: r [
	^ ((dest - self) * r) + self
]

{ #category : #accessing }
GFVector3 >> length [
	^ ((x * x) + (y * y) + (z * z)) sqrt
]

{ #category : #'as yet unclassified' }
GFVector3 >> normalize [
	|l1|
	l1 := 1.0 / self length.
	self
		x: self x * l1;
		y: self y * l1;
		z: self z * l1
]

{ #category : #'as yet unclassified' }
GFVector3 >> normalized [
	|l1|
	l1 := 1.0 / self length.
	^ self class
		x: self x * l1
		y: self y * l1
		z: self z * l1
]

{ #category : #'as yet unclassified' }
GFVector3 >> rotate: angle axis: axis [
	|c s c1 ax ay az nx ny nz|
	c := angle cos.
	s := angle sin.
	c1 := 1 - c.
	ax := axis x.
	ay := axis y.
	az := axis z.

	nx := (x*((ax*ax*c1)+c))      + (y*((ax*ay*c1)-(az*s))) + (z*((ax*az*c1)+(ay*s))).
	ny := (x*((ay*ax*c1)+(az*s))) + (y*((ay*ay*c1)+c))      + (z*((ay*az*c1)-(ax*s))).
	nz	:= (x*((ax*az*c1)-(ay*s))) + (y*((ay*az*c1)+(ax*s))) + (z*((az*az*c1)+c)).
	x := nx.
	y := ny.
	z := nz.

]

{ #category : #adding }
GFVector3 >> sub: right [
	self
		x: self x - right;
		y: self y - right;
		z: self z - right.
	^ right
]

{ #category : #adding }
GFVector3 >> subVector: right [
	self
		x: self x - right x;
		y: self y - right y;
		z: self z - right z.
	^ right
]

{ #category : #adding }
GFVector3 >> subtracted: right [
	^ self class
		x: self x - right
		y: self y - right
		z: self z - right
]

{ #category : #adding }
GFVector3 >> subtractedVector: right [
	^ self class
		x: self x - right x
		y: self y - right y
		z: self z - right z
]

{ #category : #accessing }
GFVector3 >> x [

	^ x ifNil: [ x := 0.0 ]
]

{ #category : #accessing }
GFVector3 >> x: anObject [

	x := anObject
]

{ #category : #accessing }
GFVector3 >> y [

	^ y ifNil: [ y := 0.0 ]
]

{ #category : #accessing }
GFVector3 >> y: anObject [

	y := anObject
]

{ #category : #accessing }
GFVector3 >> z [

	^ z ifNil: [ z := 0.0 ]
]

{ #category : #accessing }
GFVector3 >> z: anObject [

	z := anObject
]
