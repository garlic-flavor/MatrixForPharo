Extension { #name : #Point }

{ #category : #'*GFMatrix' }
Point >> @ z [
	^ GFVector3 x: self x y: self y z: z
]
