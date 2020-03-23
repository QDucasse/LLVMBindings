Class {
	#name : #LLVMType,
	#superclass : #FFIExternalObject,
	#category : #'LLVMBindings-Core'
}

{ #category : #resources }
LLVMType class >> ffiLibrary [

	^ LLVMLibrary
]

{ #category : #resources }
LLVMType >> ffiLibrary [

	^ self class ffiLibrary
]

{ #category : #resources }
LLVMType >> printString [ 

	self ffiCall: #(String LLVMPrintTypeToString(LLVMType self))
]
