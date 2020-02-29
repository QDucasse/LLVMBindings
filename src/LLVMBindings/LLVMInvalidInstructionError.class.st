Class {
	#name : #LLVMInvalidInstructionError,
	#superclass : #Error,
	#instVars : [
		'instruction'
	],
	#category : #'LLVMBindings-Disassembler'
}

{ #category : #accessing }
LLVMInvalidInstructionError >> instruction [
	^ instruction
]

{ #category : #accessing }
LLVMInvalidInstructionError >> instruction: anInteger [ 
	instruction := anInteger
]
