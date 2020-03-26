Class {
	#name : #LLVMGenericValue,
	#superclass : #FFIExternalObject,
	#category : #'LLVMBindings-Core'
}

{ #category : #'as yet unclassified' }
LLVMGenericValue class >> createFromInt: anInteger withType: anLLVMType isSigned: aBoolean [

	^ self ffiCall: #(LLVMGenericValue LLVMCreateGenericValueOfInt(LLVMType anLLVMType,
																					 int anInteger,
																					 Boolean aBoolean))
																					   
]

{ #category : #'as yet unclassified' }
LLVMGenericValue class >> createGenericSignedInt32From: anInteger [

 ^ self createFromInt: anInteger withType: (LLVMInt32 create) isSigned: true
]

{ #category : #'as yet unclassified' }
LLVMGenericValue class >> createGenericUnsignedInt32From: anInteger [

 ^ self createFromInt: anInteger withType: (LLVMInt32 create) isSigned: false
]

{ #category : #'as yet unclassified' }
LLVMGenericValue class >> ffiLibrary [

	^ LLVMLibrary
]

{ #category : #'as yet unclassified' }
LLVMGenericValue >> ffiLibrary [

	^ self class ffiLibrary
]

{ #category : #'as yet unclassified' }
LLVMGenericValue >> toIntegerWithSign: aBoolean [

	^ self ffiCall: #(int LLVMGenericValueToInt (LLVMGenericValue self, Boolean aBoolean))
]

{ #category : #'as yet unclassified' }
LLVMGenericValue >> toSignedInteger [

	^ self toIntegerWithSign: true
]

{ #category : #'as yet unclassified' }
LLVMGenericValue >> toUnsignedInteger [

	^ self toIntegerWithSign: false
]
