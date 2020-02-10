Class {
	#name : #LLVMBuilder,
	#superclass : #FFIExternalObject,
	#category : #'LLVMBindings-Core'
}

{ #category : #'instance creation' }
LLVMBuilder class >> ffiLibrary [

	^ 'libLLVM.dylib' asFFILibrary
]

{ #category : #'instance creation' }
LLVMBuilder class >> new [

	^ self ffiCall: #(LLVMBuilder LLVMCreateBuilder())
]

{ #category : #building }
LLVMBuilder >> buildAdd: aValue to: anotherValue andStoreUnder: aTemporaryValueName [

	^ self ffiCall: #(LLVMValue LLVMBuildAdd(self,
                                            LLVMValue 	 aValue,
                                            LLVMValue 	 anotherValue,
                                            const char * aTemporaryValueName ))

]

{ #category : #building }
LLVMBuilder >> buildReturnStatementFromValue: aValue [ 

	^ self ffiCall: #(LLVMValue LLVMBuildRet(self,
														 LLVMValue aValue))
]

{ #category : #finalization }
LLVMBuilder >> dispose [

	self ffiCall: #(void LLVMDisposeBuilder(LLVMBuilderRef  aBuilder))
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

	^ self ffiCall: #(void LLVMPositionBuilderAtEnd(self,
														   		  LLVMBasicBlock aBasicBlock))
]

{ #category : #positioning }
LLVMBuilder >> positionBuilderBeforeInstruction: anInstruction [

	^ self ffiCall: #(void LLVMPositionBuilderBefore(self,
														   		   LLVMInstruction anInstruction))
]

{ #category : #positioning }
LLVMBuilder >> positionBuilderOnInstruction: anInstruction inBasicBlock: aBasicBlock [

	^ self ffiCall: #(void LLVMPositionBuilder(self,
														   LLVMBasicBlock aBasicBlock,
															LLVMInstruction anInstruction))
]
