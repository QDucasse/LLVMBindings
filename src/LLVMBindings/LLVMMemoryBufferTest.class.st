Class {
	#name : #LLVMMemoryBufferTest,
	#superclass : #TestCase,
	#category : #'LLVMBindings-Tests'
}

{ #category : #tests }
LLVMMemoryBufferTest >> testBufferCreationNoNullTerminator [

	| buff content |
	content := '0123456789'.
   buff := LLVMMemoryBuffer createNoNullTerminatorWithData: content andName: 'membuf'.
   self assert: buff start equals: content
]
