Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#instVars : [
		'board',
		'whitepawn',
		'blackpawn',
		'state',
		'whitePawn',
		'blackPawn'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'running' }
MyPawnTests >> setUp [ 

	super setUp.
	board := MyChessBoard empty.
   board initializePieces.
   whitePawn := MyPawn white.
   blackPawn := MyPawn black.
   state := MyUnselectedState board: board.
]

{ #category : 'running' }
MyPawnTests >> testBlackPawnBlocked [

	 | squares |
    board at: 'e7' put: (blackPawn).
    board at: 'e6' put: (whitePawn). "Pion blanc bloque la case e6"

    "Le pion noir ne devrait pas pouvoir avancer car il est bloqué"
    squares := blackPawn targetSquares.
    self assert: squares isEmpty.
]

{ #category : 'running' }
MyPawnTests >> testBlackPawnMoves [

	| squares |
    board at: 'e7' put: (blackPawn).

    "Le pion noir devrait pouvoir reculer d'une case"
    squares := blackPawn targetSquares.
    self assertCollection: squares includesAll: (#(e6) collect: [:name | board at: name]).
]

{ #category : 'running' }
MyPawnTests >> testPawnCannotMoveBackwards [

	board at: 'e4' put: whitePawn.

	state := state clickOn: (board at: 'e4').
	state := state clickOn: (board at: 'e3').

	self assert: (board at: 'e4') contents equals: whitePawn.
	self assert: (board at: 'e3') hasPiece not.
]

{ #category : 'running' }
MyPawnTests >> testWhitePawnBlocked [

	| squares |
    board at: 'e2' put: (whitePawn).
    board at: 'e3' put: (blackPawn). "Pion noir bloque la case e3"

    "Le pion blanc ne devrait pas pouvoir avancer car il est bloqué"
    squares := whitePawn targetSquares.
    self assert: squares isEmpty.
]

{ #category : 'running' }
MyPawnTests >> testWhitePawnMoves [

	| squares |
    board at: 'e2' put: (whitePawn).

    "Le pion blanc devrait pouvoir avancer d'une case"
    squares := whitePawn targetSquares.
    self assertCollection: squares includesAll: (#(e3) collect: [:name | board at: name]).
]
