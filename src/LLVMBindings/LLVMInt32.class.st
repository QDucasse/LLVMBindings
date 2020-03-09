Class {
	#name : #LLVMInt32,
	#superclass : #LLVMType,
	#category : #'LLVMBindings-Core'
}

{ #category : #'instance creation' }
LLVMInt32 class >> create [

	^ self ffiCall: #(LLVMInt32 LLVMInt32Type(void))
]
