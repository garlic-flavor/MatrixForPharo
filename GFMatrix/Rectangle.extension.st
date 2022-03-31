Extension { #name : #Rectangle }

{ #category : #'*GFMatrix' }
Rectangle >> bottomSide [
	^ GFLine2 new
		start: self bottomLeft;
		end: self bottomRight;
		yourself
]

{ #category : #'*GFMatrix' }
Rectangle >> leftSide [
	^ GFLine2 new
		start: self topLeft;
		end: self bottomLeft;
		yourself
]

{ #category : #'*GFMatrix' }
Rectangle >> rightSide [
	^ GFLine2 new
		start: self bottomRight;
		end: self topRight;
		yourself
]

{ #category : #'*GFMatrix' }
Rectangle >> topSide [
	^ GFLine2 new
		start: self topRight;
		end: self topLeft;
		yourself
]
