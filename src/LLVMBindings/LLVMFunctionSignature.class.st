Class {
	#name : #LLVMFunctionSignature,
	#superclass : #LLVMType,
	#category : #'LLVMBindings-Core'
}

{ #category : #'instance creation' }
LLVMFunctionSignature class >> withReturnType: aType parametersVector: anArray arity: anInteger andIsVaridic: aBoolean [

"Output a function type consisting of a specified signature"

^ self ffiCall: #(#LLVMFunctionSignature LLVMFunctionType(LLVMType aType, 
															            LLVMParameterArray anArray, 
															            int anInteger, 
															            Boolean aBoolean))
]

{ #category : #adding }
LLVMFunctionSignature >> addToModule: aModule withName: aName [

"Output a value"

	^ self ffiCall: #(LLVMFunction LLVMAddFunction(LLVMModule aModule, 
	                                               String aName, 
	        											       self))
]

{ #category : #adding }
LLVMFunctionSignature >> isVaridic [

	^ self ffiCall: #(Boolean LLVMIsFunctionVarArg(self))
]

{ #category : #adding }
LLVMFunctionSignature >> parametersNumber [

	^ self ffiCall: #(uint LLVMCountParamTypes(self))
]

{ #category : #adding }
LLVMFunctionSignature >> returnType [

	^ self ffiCall: #(LLVMType LLVMGetReturnType(self))
]
