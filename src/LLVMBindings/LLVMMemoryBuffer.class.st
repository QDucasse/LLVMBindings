Class {
	#name : #LLVMMemoryBuffer,
	#superclass : #FFIExternalObject,
	#category : #'LLVMBindings-Core'
}

{ #category : #resources }
LLVMMemoryBuffer class >> ffiLibrary [

	^ 'libLLVM.dylib' asFFILibrary
]

{ #category : #resources }
LLVMMemoryBuffer >> ffiLibrary [

	^ self class ffiLibrary
]
