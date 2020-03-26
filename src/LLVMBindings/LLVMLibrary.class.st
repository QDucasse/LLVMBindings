Class {
	#name : #LLVMLibrary,
	#superclass : #FFILibrary,
	#category : #'LLVMBindings-Core'
}

{ #category : #'accessing platform' }
LLVMLibrary >> macLibraryName [

	^ '/usr/local/opt/llvm/lib/libLLVM.dylib'
]
