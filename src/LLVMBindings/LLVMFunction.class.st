Class {
	#name : #LLVMFunction,
	#superclass : #LLVMValue,
	#category : #'LLVMBindings-Core'
}

{ #category : #adding }
LLVMFunction >> firstParameter [

	^ self ffiCall: #(LLVMFunctionParameter LLVMGetFirstParam(LLVMFunction self))
]

{ #category : #adding }
LLVMFunction >> lastParameter [

	^ self ffiCall: #(LLVMFunctionParameter LLVMGetLastParam(LLVMFunction self))
]

{ #category : #adding }
LLVMFunction >> nextParameterOf: aParameter [

	^ self ffiCall: #(LLVMFunctionParameter LLVMGetNextParam(LLVMFunction self))
]

{ #category : #adding }
LLVMFunction >> parameterAtIndex: anInteger [

	^ self ffiCall: #(LLVMFunctionParameter LLVMGetParam(LLVMFunction self, uint anInteger))
]

{ #category : #adding }
LLVMFunction >> parametersNumber [

	^ self ffiCall: #(uint LLVMCountParams(LLVMFunction self))
]

{ #category : #adding }
LLVMFunction >> previousParameterOf: aParameter [

	^ self ffiCall: #(LLVMFunctionParameter LLVMGetPreviousParam(LLVMFunction self))
]
