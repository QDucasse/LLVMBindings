Class {
	#name : #LLVMInt32Test,
	#superclass : #TestCase,
	#category : #'LLVMBindings-Tests'
}

{ #category : #tests }
LLVMInt32Test >> testStringRepresentation [

	self assert: LLVMInt32 create printString equals: 'i32'  
]
