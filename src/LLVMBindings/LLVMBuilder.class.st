Class {
	#name : #LLVMBuilder,
	#superclass : #FFIExternalObject,
	#category : #'LLVMBindings-Core'
}

{ #category : #'instance creation' }
LLVMBuilder class >> create [
	
	^ self ffiCall: #(LLVMBuilder LLVMCreateBuilder(void))
]

{ #category : #'instance creation' }
LLVMBuilder class >> ffiLibrary [

	^ 'libLLVM.dylib' asFFILibrary
]

{ #category : #building }
LLVMBuilder >> buildAdd: aValue to: anotherValue andStoreUnder: aTemporaryValueName [

	^ self ffiCall: #(LLVMValue LLVMBuildAdd(LLVMBuilder self,
                                            LLVMValue 	 aValue,
                                            LLVMValue 	 anotherValue,
                                            const char * aTemporaryValueName ))
]

{ #category : #building }
LLVMBuilder >> buildReturnStatementFromValue: aValue [ 

	^ self ffiCall: #(LLVMValue LLVMBuildRet(LLVMBuilder self,
														 LLVMValue aValue))
]

{ #category : #finalization }
LLVMBuilder >> dispose [

	self ffiCall: #(void LLVMDisposeBuilder(LLVMBuilder self))
]

{ #category : #finalization }
LLVMBuilder >> ffiLibrary [

	^ self class ffiLibrary
]

{ #category : #finalization }
LLVMBuilder >> finalize [ 

	^ self dispose
]

{ #category : #positioning }
LLVMBuilder >> positionBuilderAtEndOfBasicBlock: aBasicBlock [

	^ self ffiCall: #(void LLVMPositionBuilderAtEnd(LLVMBuilder self,
														   		  LLVMBasicBlock aBasicBlock))
]

{ #category : #positioning }
LLVMBuilder >> positionBuilderBeforeInstruction: anInstruction [

	^ self ffiCall: #(void LLVMPositionBuilderBefore(LLVMBuilder self,
														   		   LLVMInstruction anInstruction))
]

{ #category : #positioning }
LLVMBuilder >> positionBuilderOnInstruction: anInstruction inBasicBlock: aBasicBlock [

	^ self ffiCall: #(void LLVMPositionBuilder(LLVMBuilder     self,
														   LLVMBasicBlock  aBasicBlock, 
															LLVMInstruction anInstruction))
]
