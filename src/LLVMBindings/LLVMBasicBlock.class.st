Class {
	#name : #LLVMBasicBlock,
	#superclass : #FFIExternalObject,
	#category : #'LLVMBindings-Core'
}

{ #category : #linking }
LLVMBasicBlock class >> appendToFunction: aFunctionValue withName: aName [

	^ self ffiCall: #(LLVMBasicBlock LLVMAppendBasicBlock(LLVMValue aFunctionValue, 
																		  String aName))
]

{ #category : #linking }
LLVMBasicBlock class >> createInContext: anLLVMContext withName: aName [

	^ self ffiCall: #(LLVMBasicBlock LLVMCreateBasicBlockInContext(LLVMContext anLLVMContext,
                                                                  String aName	))
]

{ #category : #linking }
LLVMBasicBlock class >> ffiLibrary [

	^ 'libLLVM.dylib' asFFILibrary
]

{ #category : #accessing }
LLVMBasicBlock >> delete [ 

	self ffiCall: #(void LLVMDeleteBasicBlock(LLVMBasicBlock self))
]

{ #category : #accessing }
LLVMBasicBlock >> ffiLibrary [

	^ self class ffiLibrary
]

{ #category : #accessing }
LLVMBasicBlock >> name [ 

	^ self ffiCall: #(const char* LLVMGetBasicBlockName(LLVMBasicBlock self))
]

{ #category : #accessing }
LLVMBasicBlock >> parent [ 

	^ self ffiCall: #(LLVMValue LLVMGetBasicBlockParent(LLVMBasicBlock self))
]
