Class {
	#name : 'MyNilPiecesTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyNilPiecesTests >> testHasNoAttackingSquares [

	self assert: MyNilPiece new attackingSquares isEmpty
]

{ #category : 'tests' }
MyNilPiecesTests >> testHasNoLegalTargetSquares [

	self assert: (MyNilPiece new targetSquaresLegal: true) isEmpty
]

{ #category : 'tests' }
MyNilPiecesTests >> testHasNoTargetSquares [

	self assert: MyNilPiece new targetSquares isEmpty
]

{ #category : 'tests' }
MyNilPiecesTests >> testIsNotAPiece [

	self assert: MyNilPiece new isPiece not
]
