Class {
	#name : #LLVMInstruction,
	#superclass : #LLVMValue,
	#category : #'LLVMBindings-Core'
}

{ #category : #accessing }
LLVMInstruction >> assembly [
	^ assembly
]

{ #category : #accessing }
LLVMInstruction >> assembly: aString [ 
	assembly := aString
]

{ #category : #accessing }
LLVMInstruction >> size [
	^ size
]

{ #category : #accessing }
LLVMInstruction >> size: anInteger [ 
	size := anInteger
]
