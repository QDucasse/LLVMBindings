Class {
	#name : #LLVMFunctionSignature,
	#superclass : #LLVMType,
	#category : #'LLVMBindings-Core'
}

{ #category : #'instance creation' }
LLVMFunctionSignature class >> withReturnType: aType parametersVector: anArray arity: anInteger andIsVariadic: aBoolean [

"Output a function type consisting of a specified signature"

^ self ffiCall: #(LLVMFunctionSignature LLVMFunctionType(LLVMType aType, 
															           LLVMParameterArray anArray, 
															           int anInteger, 
															           Boolean aBoolean))
]

{ #category : #adding }
LLVMFunctionSignature >> addToModule: aModule withName: aName [

"Output a value"

	^ self ffiCall: #(LLVMFunction LLVMAddFunction(LLVMModule            aModule, 
	                                               String                aName, 
	        											       LLVMFunctionSignature self))
]

{ #category : #adding }
LLVMFunctionSignature >> isVariadic [

	^ self ffiCall: #(Boolean LLVMIsFunctionVarArg(LLVMFunctionSignature self))
]

{ #category : #adding }
LLVMFunctionSignature >> parametersNumber [

	^ self ffiCall: #(uint LLVMCountParamTypes(LLVMFunctionSignature self))
]

{ #category : #adding }
LLVMFunctionSignature >> returnType [

	^ self ffiCall: #(LLVMType LLVMGetReturnType(LLVMFunctionSignature self))
]
