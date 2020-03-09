Class {
	#name : #LLVMModuleTest,
	#superclass : #TestCase,
	#category : #'LLVMBindings-Tests'
}

{ #category : #tests }
LLVMModuleTest >> testTargetTripleSetAndRead [
	
	| mod |
	mod := LLVMModule withName: 'mod'.
	mod target: 'i386'.
 	self assert: mod target equals: 'i386'
]
