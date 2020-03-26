"
Used in the Disassembler when an invalid instruction is being processed.
"
Class {
	#name : #LLVMInvalidInstructionError,
	#superclass : #Error,
	#instVars : [
		'instruction'
	],
	#category : #'LLVMBindings-Error'
}

{ #category : #accessing }
LLVMInvalidInstructionError >> instruction [
	^ instruction
]

{ #category : #accessing }
LLVMInvalidInstructionError >> instruction: anInteger [ 
	instruction := anInteger
]
