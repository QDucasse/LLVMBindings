Class {
	#name : #LLVMConstant,
	#superclass : #LLVMValue,
	#category : #'LLVMBindings-Core'
}

{ #category : #'as yet unclassified' }
LLVMConstant class >> createConstInt32NoSignExtentFrom: anInteger [  

	^ self createConstIntOfType: LLVMInt32 create from: anInteger withSignExtent: false 
]

{ #category : #'as yet unclassified' }
LLVMConstant class >> createConstInt32SignExtentFrom: anInteger [  

	^ self createConstIntOfType: LLVMInt32 create from: anInteger withSignExtent: true 
]

{ #category : #'as yet unclassified' }
LLVMConstant class >> createConstIntOfType: anLLVMIntType from: anInteger withSignExtent: aBoolean [ 

	^ self ffiCall: #(LLVMValue LLVMConstInt(LLVMType anLLVMIntType,
														 int anInteger,
														 Boolean aBoolean))
]
