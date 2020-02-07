Class {
	#name : #LLVMBasicBlock,
	#superclass : #FFIExternalObject,
	#category : #'LLVMBindings-Core'
}

{ #category : #linking }
LLVMBasicBlock class >> linkToFunction: aFunctionValue withName: aName [

	^ self ffiCall: #(LLVMBasicBlock LLVMAppendBasicBlock(LLVMValue aFunctionValue, 
																		  String aName))
]

{ #category : #accessing }
LLVMBasicBlock >> delete [ 

	self ffiCall: #(void LLVMDeleteBasicBlock())
]

{ #category : #accessing }
LLVMBasicBlock >> name [ 

	^ self ffiCall: #(const char* LLVMGetBasicBlockName(self))
]

{ #category : #accessing }
LLVMBasicBlock >> parent [ 

	^ self ffiCall: #(LLVMValue LLVMGetBasicBlockParent(self))
]
