"
4x4 column-major matrix.
```
    | _11, _21, _31, _41 |   | 0,  4,  8,  12 |
M = | _12, _22, _32, _42 | = | 1,  5,  9,  13 |
    | _13, _23, _33, _43 |   | 2,  6,  10, 14 |
    | _14, _24, _34, _44 |   | 3,  7,  11, 15 |

"
Class {
	#name : #GFMatrix4x4,
	#superclass : #Object,
	#instVars : [
		'_11',
		'_12',
		'_13',
		'_14',
		'_21',
		'_22',
		'_23',
		'_24',
		'_31',
		'_32',
		'_33',
		'_34',
		'_41',
		'_42',
		'_43',
		'_44'
	],
	#category : #GFMatrix
}

{ #category : #'as yet unclassified' }
GFMatrix4x4 class >> frustumWidth: w height: h near: n far: f [
	|fn1|

	fn1 := 1/(f-n).
	^ self new
		_11: 2*n/w;
		_12: 0.0;
		_13: 0.0;
		_14: 0.0;
		
		_21: 0.0;
		_22: 2*n/h;
		_23: 0.0;
		_24: 0.0;
		
		_31: 0.0;
		_32: 0.0;
		_33: -1 * (f+n)*fn1;
		_34: -1.0;

		_41: 0.0;
		_42: 0.0;
		_43: -2*f*n*fn1;
		_44: 0.0;
		yourself

]

{ #category : #'instance creation' }
GFMatrix4x4 class >> identity [
	^ self new
		_11: 1.0;
		_12: 0.0;
		_13: 0.0;
		_14: 0.0;
		
		_21: 0.0;
		_22: 1.0;
		_23: 0.0;
		_24: 0.0;
		
		_31: 0.0;
		_32: 0.0;
		_33: 1.0;
		_34: 0.0;
		
		_41: 0.0;
		_42: 0.0;
		_43: 0.0;
		_44: 1.0;
		yourself
]

{ #category : #accessing }
GFMatrix4x4 class >> lookAt: center from: eye up: up [
	|x y z e|
	z := eye - center.
	z normalize.
	x := up cross: z.
	x normalize.
	y := z cross: x.

	e := GFVector3
		x: (-1 * x x*eye x) - (x y*eye y) - (x z*eye z)
		y: (-1 * y x*eye x) - (y y*eye y) - (y z*eye z)
		z: (-1 * z x*eye x) - (z y*eye y) - (z z*eye z).
	^ self new
		_11: x x;
		_12: y x;
		_13: z x;
		_14: 0.0;
		
		_21: x y;
		_22: y y;
		_23: z y;
		_24: 0.0;
		
		_31: x z;
		_32: y z;
		_33: z z;
		_34: 0;
		
		_41: e x;
		_42: e y;
		_43: e z;
		_44: 1.0;
		yourself

]

{ #category : #'as yet unclassified' }
GFMatrix4x4 class >> lookFor: lf up: up [
	|x y z|
	z := GFVector3 x: -1 * lf x y: -1 * lf y z: -1 * lf z.
	z normalize.
	x := up cross: z.
	x normalize.
	y := z cross: x.
	^ self new
		_11: x x;
		_12: y x;
		_13: z x;
		_14: 0.0;
		
		_21: x y;
		_22: y y;
		_23: z y;
		_24: 0.0;
		
		_31: x z;
		_32: y z;
		_33: z z;
		_34: 0.0;
		
		_41: 0.0;
		_42: 0.0;
		_43: 0.0;
		_44: 1.0;
		yourself

]

{ #category : #'instance creation' }
GFMatrix4x4 class >> orthoLeft: l right: r bottom: b top: t near: n far: f [
	|rl1 tb1 fn1|
	rl1 := 1 / (r - l).
	tb1 := 1 / (t - b).
	fn1 := 1 / (f - n).
	^ self new
		_11: 2 * rl1;
		_12: 0.0;
		_13: 0.0;
		_14: 0.0;
		
		_21: 0.0;
		_22: 2 * tb1;
		_23: 0.0;
		_24: 0.0;
		
		_31: 0.0;
		_32: 0.0;
		_33: -2 * fn1;
		_34: 0.0;
		
		_41: -1 * (r+l) * rl1;
		_42: -1 * (t+b) * tb1;
		_43: -1 * (f+n) * fn1;
		_44: 1.0;
		yourself

]

{ #category : #'as yet unclassified' }
GFMatrix4x4 class >> perspectiveFovy: fovy asp: asp near: n far: f [
	|f1 fn1|
	f1 := 1/((fovy*0.5*Float pi / 180.0) tan).
	fn1 := 1/(f-n).
	^ self new
		_11: f1/asp;
		_12: 0.0;
		_13: 0.0;
		_14: 0.0;

		_21: 0.0;
		_22: f1;
		_23: 0.0;
		_24: 0.0;
		
		_31: 0.0;
		_32: 0.0;
		_33: -1 * (f+n)*fn1;
		_34: -1.0;

		_41: 0.0;
		_42: 0.0;
		_43: -2*f*n*fn1;
		_44: 0.0;
		yourself

]

{ #category : #'as yet unclassified' }
GFMatrix4x4 class >> rotate: angle axis: a [
	|c s c1|
	c := angle cos.
	s := angle sin.
	c1 := 1 - c.
	^ self new
		_11: (a x*a x*c1)+c;
		_12: (a y*a x*c1)+(a z*s);
		_13: (a x*a z*c1)-(a y*s);
		_14: 0.0;
		
		_21: (a x*a y*c1)-(a z*s);
		_22: (a y*a y*c1)+c;
		_23: (a y*a z*c1)+(a x*s);
		_24: 0.0;

		_31: (a x*a z*c1)+(a y*s);
		_32: (a y*a z*c1)-(a x*s);
		_33: (a z*a z*c1)+c;
		_34: 0.0;
		
		_41: 0.0;
		_42: 0.0;
		_43: 0.0;
		_44: 1.0;
		yourself

]

{ #category : #'instance creation' }
GFMatrix4x4 class >> scaleX: x y: y z: z [
	^ self new
		_11: x;
		_12: 0.0;
		_13: 0.0;
		_14: 0.0;
		
		_21: 0.0;
		_22: y;
		_23: 0.0;
		_24: 0.0;
		
		_31: 0.0;
		_32: 0.0;
		_33: z;
		_34: 0.0;
		
		_41: 0.0;
		_42: 0.0;
		_43: 0.0;
		_44: 1.0;
		yourself
]

{ #category : #'instance creation' }
GFMatrix4x4 class >> translateX: x y: y z: z [
	^ self new
		_11: 1.0;
		_12: 0.0;
		_13: 0.0;
		_14: 0.0;
		
		_21: 0.0;
		_22: 1.0;
		_23: 0.0;
		_24: 0.0;
		
		_31: 0.0;
		_32: 0.0;
		_33: 1.0;
		_34: 0.0;
		
		_41: x;
		_42: y;
		_43: z;
		_44: 1.0;
		yourself
]

{ #category : #accessing }
GFMatrix4x4 >> _11 [

	^ _11
]

{ #category : #accessing }
GFMatrix4x4 >> _11: anObject [

	_11 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _12 [

	^ _12
]

{ #category : #accessing }
GFMatrix4x4 >> _12: anObject [

	_12 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _13 [

	^ _13
]

{ #category : #accessing }
GFMatrix4x4 >> _13: anObject [

	_13 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _14 [

	^ _14
]

{ #category : #accessing }
GFMatrix4x4 >> _14: anObject [

	_14 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _21 [

	^ _21
]

{ #category : #accessing }
GFMatrix4x4 >> _21: anObject [

	_21 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _22 [

	^ _22
]

{ #category : #accessing }
GFMatrix4x4 >> _22: anObject [

	_22 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _23 [

	^ _23
]

{ #category : #accessing }
GFMatrix4x4 >> _23: anObject [

	_23 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _24 [

	^ _24
]

{ #category : #accessing }
GFMatrix4x4 >> _24: anObject [

	_24 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _31 [

	^ _31
]

{ #category : #accessing }
GFMatrix4x4 >> _31: anObject [

	_31 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _32 [

	^ _32
]

{ #category : #accessing }
GFMatrix4x4 >> _32: anObject [

	_32 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _33 [

	^ _33
]

{ #category : #accessing }
GFMatrix4x4 >> _33: anObject [

	_33 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _34 [

	^ _34
]

{ #category : #accessing }
GFMatrix4x4 >> _34: anObject [

	_34 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _41 [

	^ _41
]

{ #category : #accessing }
GFMatrix4x4 >> _41: anObject [

	_41 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _42 [

	^ _42
]

{ #category : #accessing }
GFMatrix4x4 >> _42: anObject [

	_42 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _43 [

	^ _43
]

{ #category : #accessing }
GFMatrix4x4 >> _43: anObject [

	_43 := anObject
]

{ #category : #accessing }
GFMatrix4x4 >> _44 [

	^ _44
]

{ #category : #accessing }
GFMatrix4x4 >> _44: anObject [

	_44 := anObject
]

{ #category : #arithmetic }
GFMatrix4x4 >> determinant [
	^ (_11*_22*_33*_44) + (_11*_32*_43*_24) + (_11*_42*_23*_34)
		+ (_21*_12*_43*_34) + (_21*_32*_13*_44) + (_21*_42*_33*_14)
		+ (_31*_12*_23*_44) + (_31*_22*_43*_14) + (_31*_42*_13*_24)
		+ (_41*_12*_33*_24) + (_41*_22*_13*_34) + (_41*_32*_23*_14)
		- (_11*_22*_43*_34) - (_11*_32*_23*_44) - (_11*_42*_33*_24)
		- (_21*_12*_33*_44) - (_21*_32*_43*_14) - (_21*_42*_13*_34)
		- (_31*_12*_43*_24) - (_31*_22*_13*_44) - (_31*_42*_23*_14)
		- (_41*_12*_23*_34) - (_41*_22*_33*_14) - (_41*_32*_13*_24)

]

{ #category : #arithmetic }
GFMatrix4x4 >> inversed [
	|det1|
	det1 := 1 / self determinant.
	^ self class new
		_11: ((_22*_33*_44)+(_32*_43*_24)+(_42*_23*_34)-(_22*_43*_34)-(_32*_23*_44)-(_42*_33*_24))*det1;
		_12: ((_12*_43*_34)+(_32*_13*_44)+(_42*_33*_14)-(_12*_33*_44)-(_32*_43*_14)-(_42*_13*_34))*det1;
		_13: ((_12*_23*_44)+(_22*_43*_14)+(_42*_13*_24)-(_12*_43*_24)-(_22*_13*_44)-(_42*_23*_14))*det1;
		_14: ((_12*_33*_24)+(_22*_13*_34)+(_32*_23*_14)-(_12*_23*_34)-(_22*_33*_14)-(_32*_13*_24))*det1;

		_21: ((_21*_43*_34)+(_31*_23*_44)+(_41*_33*_24)-(_21*_33*_44)-(_31*_43*_24)-(_41*_23*_34))*det1;
		_22: ((_11*_33*_44)+(_31*_43*_14)+(_41*_13*_34)-(_11*_43*_34)-(_31*_13*_44)-(_41*_33*_14))*det1;
		_23: ((_11*_43*_24)+(_21*_13*_44)+(_41*_23*_14)-(_11*_23*_44)-(_21*_43*_14)-(_41*_13*_24))*det1;
		_24: ((_11*_23*_34)+(_21*_33*_14)+(_31*_13*_24)-(_11*_33*_24)-(_21*_13*_34)-(_31*_23*_14))*det1;

		_31: ((_21*_32*_44)+(_31*_42*_24)+(_41*_22*_34)-(_21*_42*_34)-(_31*_22*_44)-(_41*_32*_24))*det1;
		_32: ((_11*_42*_34)+(_31*_12*_44)+(_41*_32*_14)-(_11*_32*_44)-(_31*_42*_14)-(_41*_12*_34))*det1;
		_33: ((_11*_22*_44)+(_21*_42*_14)+(_41*_12*_24)-(_11*_42*_24)-(_21*_12*_44)-(_41*_22*_14))*det1;
		_34: ((_11*_32*_24)+(_21*_12*_34)+(_31*_22*_14)-(_11*_22*_34)-(_21*_32*_14)-(_31*_12*_24))*det1;

		_41: ((_21*_42*_33)+(_31*_22*_43)+(_41*_32*_23)-(_21*_32*_43)-(_31*_42*_23)-(_41*_22*_33))*det1;
		_42: ((_11*_32*_43)+(_31*_42*_13)+(_41*_12*_33)-(_11*_42*_33)-(_31*_12*_43)-(_41*_32*_13))*det1;
		_43: ((_11*_42*_23)+(_21*_12*_43)+(_41*_22*_13)-(_11*_22*_43)-(_21*_42*_13)-(_41*_12*_23))*det1;
		_44: ((_11*_22*_33)+(_21*_32*_13)+(_31*_12*_23)-(_11*_32*_23)-(_21*_12*_33)-(_31*_22*_13))*det1;
		yourself

]

{ #category : #'as yet unclassified' }
GFMatrix4x4 >> multiplied: r [
	^ self class new
		_11: (_11*r _11) + (_21*r _12) + (_31*r _13) + (_41*r _14);
		_12: (_12*r _11) + (_22*r _12) + (_32*r _13) + (_42*r _14);
		_13: (_13*r _11) + (_23*r _12) + (_33*r _13) + (_43*r _14);
		_14: (_14*r _11) + (_24*r _12) + (_34*r _13) + (_44*r _14);

		_21: (_11*r _21) + (_21*r _22) + (_31*r _23) + (_41*r _24);
		_22: (_12*r _21) + (_22*r _22) + (_32*r _23) + (_42*r _24);
		_23: (_13*r _21) + (_23*r _22) + (_33*r _23) + (_43*r _24);
		_24: (_14*r _21) + (_24*r _22) + (_34*r _23) + (_44*r _24);

		_31: (_11*r _31) + (_21*r _32) + (_31*r _33) + (_41*r _34);
		_32: (_12*r _31) + (_22*r _32) + (_32*r _33) + (_42*r _34);
		_33: (_13*r _31) + (_23*r _32) + (_33*r _33) + (_43*r _34);
		_34: (_14*r _31) + (_24*r _32) + (_34*r _33) + (_44*r _34);

		_41: (_11*r _41) + (_21*r _42) + (_31*r _43) + (_41*r _44);
		_42: (_12*r _41) + (_22*r _42) + (_32*r _43) + (_42*r _44);
		_43: (_13*r _41) + (_23*r _42) + (_33*r _43) + (_43*r _44);
		_44: (_14*r _41) + (_24*r _42) + (_34*r _43) + (_44*r _44);
		yourself

]

{ #category : #'as yet unclassified' }
GFMatrix4x4 >> multipliedVector: v [
	|w|
	w := 1 / ((_14 * v x) + (_24 * v y) + (_34 * v z) + _44 ).
	^ GFVector3
		x: ((_11 * v x) + (_21 * v y) + (_31 * v z) + _41) * w
		y: ((_12 * v x) + (_22 * v y) + (_32 * v z) + _42) * w
		z: ((_13 * v x) + (_23 * v y) + (_33 * v z) + _43) * w


]

{ #category : #'point functions' }
GFMatrix4x4 >> transposed [
	^ self class new
		_11: _11;
		_12: _21;
		_13: _31;
		_14: _41;
		
		_21: _12;
		_22: _22;
		_23: _32;
		_24: _42;
		
		_31: _13;
		_32: _23;
		_33: _33;
		_34: _43;
		
		_41: _14;
		_42: _24;
		_43: _34;
		_44: _44;
		yourself
]
