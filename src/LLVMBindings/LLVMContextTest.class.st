Class {
	#name : #LLVMContextTest,
	#superclass : #TestCase,
	#category : #'LLVMBindings-Tests'
}

{ #category : #tests }
LLVMContextTest >> testShouldDiscardValueSetAndRead [

	| cont |
	cont := LLVMContext create.
	cont shouldDiscardValueNames: true.
	self assert: cont shouldDiscardValueNames equals: true
]
