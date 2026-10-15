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
MyPawn >> isEnemyPiece: aPiece [

	^ (aPiece isWhite not and: [ self isWhite ]) or: (aPiece isWhite and: [ self isWhite not ])
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

	| forwardSquare doubleForwardSquare attackLeft attackRight legalMoves |

forwardSquare := self isWhite
    ifTrue: [ square up ]
    ifFalse: [ square down ].

doubleForwardSquare := self isWhite
            ifTrue: [ forwardSquare up ]
            ifFalse: [ forwardSquare down ].

attackLeft := self isWhite
    ifTrue: [ square up left]
    ifFalse: [ square down left].

attackRight := self isWhite
    ifTrue: [ square up right]
    ifFalse: [ square down right].

legalMoves := OrderedCollection new.

"Déplacement vers l'avant"
forwardSquare isOnBoard ifTrue: [
    forwardSquare hasPiece ifFalse: [
        legalMoves add: forwardSquare.

        isFirstMove ifTrue: [
            doubleForwardSquare isOnBoard ifTrue: [
                doubleForwardSquare hasPiece ifFalse: [
                    legalMoves add: doubleForwardSquare ] ] ] ] ].

"Capture en diagonale à gauche"
attackLeft isOnBoard ifTrue: [
    attackLeft hasPiece ifTrue: [ 
		(self isEnemyPiece: attackLeft contents) ifTrue: [ 
			legalMoves add: attackLeft ] ] ].

"Capture en diagonale à droite"
attackRight isOnBoard ifTrue: [
    attackRight hasPiece ifTrue: [ 
		(self isEnemyPiece: attackRight contents) ifTrue: [
			legalMoves add: attackRight ] ] ].

^ legalMoves
]
