Class {
	#name : #LLVMType,
	#superclass : #FFIExternalObject,
	#category : #'LLVMBindings-Core'
}

{ #category : #resources }
LLVMType class >> ffiLibrary [

	^ 'libLLVM.dylib' asFFILibrary
]

{ #category : #resources }
LLVMType >> ffiLibrary [

	^ self class ffiLibrary
]
