Class {
	#name : #LLVMMemoryBuffer,
	#superclass : #FFIExternalObject,
	#category : #'LLVMBindings-Core'
}

{ #category : #resources }
LLVMMemoryBuffer class >> createNoNullTerminatorWithData: aString andName: aName [

	^ self createWithData: aString range: aString size name: aName andNullTerminator: false
]

{ #category : #resources }
LLVMMemoryBuffer class >> createNullTerminatorWithData: aString andName: aName [

	^ self createWithData: aString range: aString size name: aName andNullTerminator: true
]

{ #category : #resources }
LLVMMemoryBuffer class >> createWithData: aString range: anInteger name: aName andNullTerminator: aBoolean [

	^ self ffiCall: #(LLVMMemoryBuffer LLVMCreateMemoryBufferWithMemoryRange(String aString,
	 													size_t anInteger,
														String aName,
														Boolean aBoolean))
]

{ #category : #resources }
LLVMMemoryBuffer class >> ffiLibrary [

	^ LLVMLibrary
]

{ #category : #resources }
LLVMMemoryBuffer >> ffiLibrary [

	^ self class ffiLibrary
]

{ #category : #resources }
LLVMMemoryBuffer >> start [

	^ self ffiCall: #(String LLVMGetBufferStart(LLVMMemoryBuffer self))
]
