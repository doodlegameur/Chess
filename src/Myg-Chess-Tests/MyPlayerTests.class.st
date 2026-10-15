Class {
	#name : 'MyPlayerTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPlayerTests >> testPiecesExcludesEmptyPieces [

	| game board player |
    game := MyChessGame freshGame.
    board := MyChessBoard empty.
    game board: board.
    player := MyPlayer new white game: game.

    self assert: player pieces isEmpty
]
