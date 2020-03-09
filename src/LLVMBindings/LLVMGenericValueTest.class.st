Class {
	#name : #LLVMGenericValueTest,
	#superclass : #TestCase,
	#category : #'LLVMBindings-Tests'
}

{ #category : #running }
LLVMGenericValueTest >> testCreateFromUnsignedInt [

	| gen nb |
	nb := 30000000000.
	gen := LLVMGenericValue createGenericUnsignedInt32From: nb.
	self assert: gen toUnsignedInteger equals: nb
]
