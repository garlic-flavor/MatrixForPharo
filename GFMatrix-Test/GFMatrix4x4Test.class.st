Class {
	#name : #GFMatrix4x4Test,
	#superclass : #TestCase,
	#category : #'GFMatrix-Test'
}

{ #category : #tests }
GFMatrix4x4Test >> testIdentity [
	|m|
	m := GFMatrix4x4 identity.
	self assert: m _11 equals: 1
]

{ #category : #tests }
GFMatrix4x4Test >> testPerspective [
	|mat v v2|
	mat := (GFMatrix4x4 perspectiveFovy: 45 asp: 1 near: 1 far: 3)
		* (GFMatrix4x4 lookAt: (GFVector3 x: 0 y: 0 z: 0) from: (GFVector3 x: 0 y: 0 z: 2) up: (GFVector3 x: 0 y: 1 z: 0)).
	v := GFVector3 x: 0 y: 0 z: 0.
	v2 := mat * v.
	v2 inspect
	

]
