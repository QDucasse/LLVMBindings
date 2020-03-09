Class {
	#name : #LLVMFunctionSignatureTest,
	#superclass : #TestCase,
	#instVars : [
		'paramArray',
		'ret',
		'sig'
	],
	#category : #'LLVMBindings-Tests'
}

{ #category : #running }
LLVMFunctionSignatureTest >> setUp [

	paramArray := LLVMParameterArray withSize: 2.
	paramArray at: 1 put: (LLVMInt32 new handle getHandle).
	paramArray at: 2 put: (LLVMInt32 new handle getHandle).
	ret := LLVMInt32 new.
	sig := LLVMFunctionSignature withReturnType: ret parametersVector: paramArray arity: 2 andIsVaridic: false.

]

{ #category : #tests }
LLVMFunctionSignatureTest >> testParametersNumberSetAndRead [

	self assert: sig parametersNumber equals: 2
]

{ #category : #tests }
LLVMFunctionSignatureTest >> testReturnTypeSetAndRead [

	self assert: sig returnType equals: ret
]

{ #category : #tests }
LLVMFunctionSignatureTest >> testVaridicSetAndRead [

	self assert: sig isVaridic equals: false
]
