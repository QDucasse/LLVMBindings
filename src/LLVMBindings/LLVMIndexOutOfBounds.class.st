"
Used in the LLVMFunction when an request to a parameter's index is out of bounds.
"
Class {
	#name : #LLVMIndexOutOfBounds,
	#superclass : #Error,
	#instVars : [
		'index'
	],
	#category : #'LLVMBindings-Error'
}

{ #category : #accessing }
LLVMIndexOutOfBounds >> index [ 
	
	^ index
]

{ #category : #accessing }
LLVMIndexOutOfBounds >> index: anInteger [
	
	index := anInteger
]
