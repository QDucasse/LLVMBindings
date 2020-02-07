Class {
	#name : #LLVMFunction,
	#superclass : #LLVMValue,
	#category : #'LLVMBindings-Core'
}

{ #category : #adding }
LLVMFunction >> firstParameter [

	^ self ffiCall: #(LLVMFunctionParameter LLVMGetFirstParam(self))
]

{ #category : #adding }
LLVMFunction >> lastParameter [

	^ self ffiCall: #(LLVMFunctionParameter LLVMGetLastParam(self))
]

{ #category : #adding }
LLVMFunction >> nextParameterOf: aParameter [

	^ self ffiCall: #(LLVMFunctionParameter LLVMGetNextParam(self))
]

{ #category : #adding }
LLVMFunction >> parameterAtIndex: anInteger [

	^ self ffiCall: #(LLVMFunctionParameter LLVMGetParam(self, uint anInteger))
]

{ #category : #adding }
LLVMFunction >> parametersNumber [

	^ self ffiCall: #(uint LLVMCountParams(self))
]

{ #category : #adding }
LLVMFunction >> previousParameterOf: aParameter [

	^ self ffiCall: #(LLVMFunctionParameter LLVMGetPreviousParam(self))
]
