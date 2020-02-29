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

{ #category : #resources }
LLVMMemoryBuffer >> start [

	^ self ffiCall: #(String LLVMGetBufferStart(LLVMMemoryBuffer self))
]
