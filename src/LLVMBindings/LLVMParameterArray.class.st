"
I represent the different types used by LLVM.
"
Class {
	#name : #LLVMParameterArray,
	#superclass : #FFIArray,
	#category : #'LLVMBindings-Core'
}

{ #category : #'instance creation' }
LLVMParameterArray class >> withSize: aNumber [

	^  FFIArray externalNewType: LLVMType size: aNumber
]
