Class {
	#name : #LLVMInt32,
	#superclass : #LLVMType,
	#category : #'LLVMBindings-Core'
}

{ #category : #'instance creation' }
LLVMInt32 class >> new [

	^ self ffiCall: #(LLVMInt32 LLVMInt32Type(void))
]
