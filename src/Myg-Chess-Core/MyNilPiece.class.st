Class {
	#name : 'MyNilPiece',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyNilPiece >> attackingSquares [ 

	^ #()
]

{ #category : 'as yet unclassified' }
MyNilPiece >> isPiece [ 

	^ false
]

{ #category : 'as yet unclassified' }
MyNilPiece >> renderPieceOn: aSquare [

	^ aSquare color isBlack
		  ifTrue: [ 'x' ]
		  ifFalse: [ 'z' ]
]

{ #category : 'as yet unclassified' }
MyNilPiece >> targetSquares [ 

	^ #()
]

{ #category : 'as yet unclassified' }
MyNilPiece >> targetSquaresLegal: aBoolean [

	^ #()
]
