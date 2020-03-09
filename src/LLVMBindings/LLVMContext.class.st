Class {
	#name : #LLVMContext,
	#superclass : #FFIExternalObject,
	#category : #'LLVMBindings-Core'
}

{ #category : #'instance creation' }
LLVMContext class >> create [ 

	^ self ffiCall: #(LLVMContext LLVMContextCreate(void))

	
]

{ #category : #'instance creation' }
LLVMContext class >> ffiLibrary [

	^ 'libLLVM.dylib' asFFILibrary
]

{ #category : #finalization }
LLVMContext >> dispose [ 

	self ffiCall: #(void LLVMContextDispose(LLVMContext self))
	
]

{ #category : #finalization }
LLVMContext >> ffiLibrary [

	^ self class ffiLibrary
]

{ #category : #finalization }
LLVMContext >> finalize [ 

	self dispose
]

{ #category : #finalization }
LLVMContext >> shouldDiscardValueNames [

	^ self ffiCall: #(Boolean LLVMContextShouldDiscardValueNames(LLVMContext self))
]

{ #category : #finalization }
LLVMContext >> shouldDiscardValueNames: aBoolean [

	self ffiCall: #(void LLVMContextSetDiscardValueNames(LLVMContext self, Boolean aBoolean))
]
