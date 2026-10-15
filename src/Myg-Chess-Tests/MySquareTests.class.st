Class {
	#name : 'MySquareTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MySquareTests >> testEmptyContentsRemainsEmpty [

	 | board square |
    board := MyChessBoard empty.
    square := board at: 'a1'.

    square emptyContents.

    self assert: square hasPiece not.
    self assert: square contents isPiece not
]

{ #category : 'tests' }
MySquareTests >> testEmptySquareHasNoPiece [

	 | board square |
    board := MyChessBoard empty.
    square := board at: 'a1'.

    self assert: square hasPiece not
]
