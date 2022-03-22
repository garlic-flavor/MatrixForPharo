Class {
	#name : #BaselineOfGFMatrix,
	#superclass : #BaselineOf,
	#category : #BaselineOfGFMatrix
}

{ #category : #baselines }
BaselineOfGFMatrix >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			spec
				package: 'GFMatrix';
				package: 'GFMatrix-Test' with: [ spec requires: #( 'GFMatrix' ) ]
		]
]

{ #category : #accessing }
BaselineOfGFMatrix >> projectClass [
	^ MetacelloCypressBaselineProject
]
