Class {
	#name : #GFVector3Test,
	#superclass : #TestCase,
	#category : #'GFMatrix-Test'
}

{ #category : #tests }
GFVector3Test >> testAdd [
	|v1|
	v1 := GFVector3 x: 1 y: 2 z: 3.
	v1 add: 3.
	self
		assert: v1 x equals: 4;
		assert: v1 y equals: 5;
		assert: v1 z equals: 6
]

{ #category : #tests }
GFVector3Test >> testAddVector [
	|v1 v2|
	v1 := GFVector3 x: 1 y: 2 z: 3.
	v2 := GFVector3 x: 4 y: 5 z: 6.
	v1 addVector: v2.
	self
		assert: v1 x equals: 5;
		assert: v1 y equals: 7;
		assert: v1 z equals: 9
]

{ #category : #test }
GFVector3Test >> testAdded [
	|v1 v2|
	v1 := GFVector3 x: 1 y: 2 z: 3.
	v2 := v1 added: 3.
	self
		assert: v1 x equals: 1;
		assert: v1 y equals: 2;
		assert: v1 z equals: 3;

		assert: v2 x equals: 4;
		assert: v2 y equals: 5;
		assert: v2 z equals: 6
]

{ #category : #test }
GFVector3Test >> testAddedVector [
	|v1 v2|
	v1 := GFVector3 x: 1 y: 2 z: 3.
	v2 := v1 addedVector: (GFVector3 x: 2 y: 3 z: 4).
	self
		assert: v1 x equals: 1;
		assert: v1 y equals: 2;
		assert: v1 z equals: 3;

		assert: v2 x equals: 3;
		assert: v2 y equals: 5;
		assert: v2 z equals: 7

]

{ #category : #test }
GFVector3Test >> testCross [
	|x z y|
	x := GFVector3 x: 1 y: 0 z: 0.
	z := GFVector3 x: 0 y: 0 z: 1.
	y := z cross: x.
	self
		assert: y x equals: 0;
		assert: y y equals: 1;
		assert: y z equals: 0

]

{ #category : #test }
GFVector3Test >> testDistance [

	|v1 v2|
	v1 := GFVector3 x: 1 y: 0 z: 0.
	v2 := GFVector3 x: 0 y: 1 z: 0.
	self assert: (v1 distance: v2) closeTo: (2 sqrt)
]

{ #category : #test }
GFVector3Test >> testDot [

	|v1 v2|
	v1 := GFVector3 x: 1 y: 0 z: 0.
	v2 := GFVector3 x: 0 y: 1 z: 0.
	self assert: (v1 dot: v2) equals: 0
]

{ #category : #test }
GFVector3Test >> testLength [

	|v|
	v := GFVector3 x: 1 y: 0 z: 0.
	self assert: v length equals: 1
]

{ #category : #test }
GFVector3Test >> testNormalize [
	|v1|
	v1 := GFVector3 x: 3 y: 4 z: 5.
	v1 normalize.
	self assert: v1 length closeTo: 1

]

{ #category : #test }
GFVector3Test >> testNormalized [
	|v1 v2|
	v1 := GFVector3 x: 3 y: 4 z: 5.
	v2 := v1 normalized.
	self assert: v2 length closeTo: 1
]

{ #category : #test }
GFVector3Test >> testPlus [

	|v v2|
	v := GFVector3 x: 1 y: 2 z: 3.
	v2 := v + 3.
	self
		assert: v x equals: 1;
		assert: v y equals: 2;
		assert: v z equals: 3;
		
		assert: v2 x equals: 4;
		assert: v2 y equals: 5;
		assert: v2 z equals: 6.

	v2 := v + (GFVector3 x: 10 y: 20 z: 30).
	self
		assert: v x equals: 1;
		assert: v y equals: 2;
		assert: v z equals: 3;
		
		assert: v2 x equals: 11;
		assert: v2 y equals: 22;
		assert: v2 z equals: 33.
	
]

{ #category : #test }
GFVector3Test >> testPlusEqualsSign [
	|v|
	v := GFVector3 x: 1 y: 2 z: 3.
	v += 2.
	self
		assert: v x equals: 3;
		assert: v y equals: 4;
		assert: v z equals: 5.
	v += (GFVector3 x: 1 y: 2 z: 3).
	self
		assert: v x equals: 4;
		assert: v y equals: 6;
		assert: v z equals: 8.

]

{ #category : #tests }
GFVector3Test >> testSub [
	|v1|
	v1 := GFVector3 x: 1 y: 2 z: 3.
	v1 sub: 3.
	self
		assert: v1 x equals: -2;
		assert: v1 y equals: -1;
		assert: v1 z equals: 0
]

{ #category : #tests }
GFVector3Test >> testSubVector [
	|v1 v2|
	v1 := GFVector3 x: 1 y: 2 z: 3.
	v2 := GFVector3 x: 4 y: 5 z: 6.
	v1 subVector: v2.
	self
		assert: v1 x equals: -3;
		assert: v1 y equals: -3;
		assert: v1 z equals: -3
]

{ #category : #test }
GFVector3Test >> testSubtracted [
	|v1 v2|
	v1 := GFVector3 x: 1 y: 2 z: 3.
	v2 := v1 subtracted: 3.
	self
		assert: v1 x equals: 1;
		assert: v1 y equals: 2;
		assert: v1 z equals: 3;

		assert: v2 x equals: -2;
		assert: v2 y equals: -1;
		assert: v2 z equals: 0
]

{ #category : #test }
GFVector3Test >> testSubtractedVector [
	|v1 v2|
	v1 := GFVector3 x: 1 y: 2 z: 3.
	v2 := v1 subtractedVector: (GFVector3 x: 2 y: 3 z: 4).
	self
		assert: v1 x equals: 1;
		assert: v1 y equals: 2;
		assert: v1 z equals: 3;

		assert: v2 x equals: -1;
		assert: v2 y equals: -1;
		assert: v2 z equals: -1

]

{ #category : #tests }
GFVector3Test >> testXyz [
	|v|
	v := GFVector3 x: 1 y: 2 z: 3.
	self
		assert: v x equals: 1;
		assert: v y equals: 2;
		assert: v z equals: 3

]
