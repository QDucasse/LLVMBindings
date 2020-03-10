Class {
	#name : #LLVMFunctionTest,
	#superclass : #TestCase,
	#instVars : [
		'paramArray',
		'ret',
		'sig',
		'mod',
		'funcValue'
	],
	#category : #'LLVMBindings-Tests'
}

{ #category : #running }
LLVMFunctionTest >> setUp [ 
	
	" Define a function signature to work on"
	paramArray := LLVMParameterArray withSize: 2.
	paramArray at: 1 put: (LLVMInt32 create handle getHandle).
	paramArray at: 2 put: (LLVMInt32 create handle getHandle).
	ret := LLVMInt32 create.
	sig := LLVMFunctionSignature withReturnType: ret parametersVector: paramArray arity: 2 andIsVaridic: false.
	
	" Define a module to add the function signature to"
	mod := LLVMModule withName: 'test'.
	funcValue := sig addToModule: mod withName: 'sum'
	

	
]

{ #category : #running }
LLVMFunctionTest >> testFirstParameterType [

	self assert: funcValue firstParameter type printString equals: 'i32' 

	
]

{ #category : #running }
LLVMFunctionTest >> testLastParameterType [

	self assert: funcValue firstParameter type printString equals: 'i32' 

	
]

{ #category : #running }
LLVMFunctionTest >> testParametersNumber [

	self assert: funcValue parametersNumber equals: 2

	
]
