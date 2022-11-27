Class {
	#name : #GFPolyline2,
	#superclass : #GFPolyline,
	#category : #GFMatrix
}

{ #category : #'as yet unclassified' }
GFPolyline2 class >> concentAt: center density: density hole: hole radius: r [
	^ self new
		vertices: ((1 to: density) collect: [ :i ||rad|
			rad := Float pi * 2 / density * i.
			{ (center x + (hole * rad cos)) @ (center y + (hole * rad sin)).
			   (center x + (r * rad cos)) @ (center y + (r * rad sin)) }
		]) flattened, {
			(center - (5 mm)).
			(center + (5 mm)).
			(center + ((5 mm)@(-5 mm))).
			(center + ((-5 mm)@(5 mm)))
		};
		indices: (1 to: ((density + 2) * 2));
		yourself
	

]
