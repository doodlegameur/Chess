Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#instVars : [
		'board',
		'state',
		'whitePawn',
		'blackPawn',
		'game'
	],
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'running' }
MyPawnTests >> setUp [ 

	super setUp.
	board := MyChessBoard empty.
	game := MyChessGame freshGame .
	game board: board.
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
MyPawnTests >> testBlackPawnCanCaptureOnLeftDiagonal [

	| squares |
	board at: 'd2' put: whitePawn.
	board at: 'e3' put: blackPawn.
	

	"Le pion noir devrait pouvoir capturer le pion blanc en diagonale"
	squares := blackPawn targetSquares.

	"Vérification que d2 fait partie des mouvements possibles"
	self assertCollection: squares includesAll: (#(d2) collect: [:name | board at: name]).

	"Déplacer le pion noir pour capturer le pion blanc"
	game move: blackPawn to: (board at: 'd2').
	self assert: (board at: 'd2') contents equals: blackPawn.
	self assert: (board at: 'e3') contents isNil
]

{ #category : 'running' }
MyPawnTests >> testBlackPawnCanCaptureOnRightDiagonal [

	| squares |
	board at: 'f2' put: whitePawn.
	board at: 'e3' put: blackPawn.
	

	"Le pion noir devrait pouvoir capturer le pion blanc en diagonale"
	squares := blackPawn targetSquares.

	"Vérification que f2 fait partie des mouvements possibles"
	self assertCollection: squares includesAll: (#(f2) collect: [:name | board at: name]).

	"Déplacer le pion noir pour capturer le pion blanc"
	game move: blackPawn to: (board at: 'f2').
	self assert: (board at: 'f2') contents equals: blackPawn.
	self assert: (board at: 'e3') contents isNil
]

{ #category : 'running' }
MyPawnTests >> testBlackPawnCanMoveTwoSquaresOnFirstMove [

	| squares |
    board at: 'e7' put: blackPawn.

    "Le pion noir devrait pouvoir descendre d'une ou deux cases"
    squares := blackPawn targetSquares.
    self assertCollection: squares includesAll: (#(e6 e5) collect: [:name | board at: name]).
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
MyPawnTests >> testWhitePawnCanCaptureOnLeftDiagonal [

	| squares |
	board at: 'e2' put: whitePawn.
	board at: 'd3' put: blackPawn.
	
	self assert: whitePawn square equals: (board at: 'e2').
	self assert: (whitePawn targetSquares includes: (board at: 'd3')).
	
	"Le pion blanc devrait pouvoir capturer le pion noir en diagonale"
	squares := whitePawn targetSquares.

	"Vérification que d3 fait partie des mouvements possibles"
	self assertCollection: squares includesAll: (#(d3) collect: [:name | board at: name]).

	"Déplacer le pion blanc pour capturer le pion noir"
	"board move: whitePawn to: (board at: 'd3').
	self assert: (board at: 'd3') contents equals: whitePawn.
	self assert: (board at: 'e2') contents isNil"
]

{ #category : 'running' }
MyPawnTests >> testWhitePawnCanCaptureOnRightDiagonal [

	| squares |
	board at: 'e2' put: whitePawn.
	board at: 'f3' put: blackPawn.
	

	"Le pion blanc devrait pouvoir capturer le pion noir en diagonale"
	squares := whitePawn targetSquares.

	"test"
	self assert: (whitePawn square = (board at: 'e2')).
	self assert: (whitePawn legalTargetSquares includes: (board at: 'f3')).
	
	"Vérification que f3 fait partie des mouvements possibles"
	self assertCollection: squares includesAll: (#(f3) collect: [:name | board at: name]).

	"Déplacer le pion blanc pour capturer le pion noir"
	game move: whitePawn to: (board at: 'f3').
	self assert: (board at: 'f3') contents equals: whitePawn.
	self assert: (board at: 'e2') contents isNil
]

{ #category : 'running' }
MyPawnTests >> testWhitePawnCanMoveTwoSquaresOnFirstMove [

	| squares |
    board at: 'e2' put: whitePawn.

    "Le pion blanc devrait pouvoir monter d'une ou deux cases"
    squares := whitePawn targetSquares.
    self assertCollection: squares includesAll: (#(e3 e4) collect: [:name | board at: name]).
]

{ #category : 'running' }
MyPawnTests >> testWhitePawnCanMoveTwoSquaresOnlyOnFirstMove [

    | squares |
    board at: 'e2' put: whitePawn.

    "Premier déplacement : deux cases autorisées"
    self assert: (whitePawn targetSquares includes: (board at: 'e4')).

    game move: whitePawn to: (board at: 'e3').

    "Après un déplacement, le pion ne peut plus avancer de deux cases"
    squares := whitePawn targetSquares.
    self assert: (squares includes: (board at: 'e5')) not.
    self assert: (squares includes: (board at: 'e4')).
]

{ #category : 'running' }
MyPawnTests >> testWhitePawnMoves [

	| squares |
    board at: 'e2' put: (whitePawn).

    "Le pion blanc devrait pouvoir avancer d'une case"
    squares := whitePawn targetSquares.
    self assertCollection: squares includesAll: (#(e3) collect: [:name | board at: name]).
]
