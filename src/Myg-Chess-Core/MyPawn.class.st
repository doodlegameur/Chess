Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'isFirstMove'
	],
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'accessing' }
MyPawn >> initialize [

	super initialize.
   isFirstMove := true
]

{ #category : 'rendering' }
MyPawn >> isFirstMove [

	^isFirstMove 
]

{ #category : 'rendering' }
MyPawn >> isFirstMove: aBoolean [

	isFirstMove := aBoolean 
]

{ #category : 'rendering' }
MyPawn >> moveTo: aSquare [

	(super moveTo: aSquare) ifTrue: [
	self isFirstMove: false ]
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

	^ (self isWhite
		   ifTrue: [
			   isFirstMove
				   ifFalse: [ { square up } ]
				   ifTrue: [
					   {
						   square up.
						   square up up } ] ]
		   ifFalse: [
			   isFirstMove
				   ifFalse: [ { square down } ]
				   ifTrue: [
					   {
						   square down.
						   square down down } ] ]) select: [ :s |
		  s notNil and: [ s hasPiece not  ] ]
]
