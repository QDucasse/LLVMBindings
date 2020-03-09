Class {
	#name : #LLVMBuilderTest,
	#superclass : #TestCase,
	#category : #'LLVMBindings-Tests'
}

{ #category : #tests }
LLVMBuilderTest >> testBuildAddStoresToTemporaryValue [

	| build integer1 integer2 tmp |
	build := LLVMBuilder create.
	integer1 := LLVMConstant createConstInt32NoSignExtentFrom: 1.
	integer2 := LLVMConstant createConstInt32NoSignExtentFrom: 2.
	tmp := build buildAdd: integer1 to: integer2 andStoreUnder: 'tmp'.
	self assert: tmp name equals: 'tmp'
]
