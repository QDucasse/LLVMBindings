"
I represent the base class of all values computed by a program. 

LLVM DOC:

LLVM Value Representation.

This is a very important LLVM class. It is the base class of all values computed by a program that may be used as operands to other values. Value is the super class of other important classes such as Instruction and Function. All Values have a Type. Type is not a subclass of Value. Some values can have a name and they belong to some Module. Setting the name on the Value automatically updates the module's symbol table.

Every value has a ""use list"" that keeps track of which other Values are using this Value. A Value can also have an arbitrary number of ValueHandle objects that watch it and listen to RAUW and Destroy events. See llvm/IR/ValueHandle.h for details.
"
Class {
	#name : #LLVMValue,
	#superclass : #FFIExternalObject,
	#category : #'LLVMBindings-Core'
}

{ #category : #resources }
LLVMValue class >> ffiLibrary [

	^ LLVMLibrary
]

{ #category : #resources }
LLVMValue >> ffiLibrary [

	^ self class ffiLibrary
]

{ #category : #accessing }
LLVMValue >> getNameWithSize: anInteger [ 

	^ self ffiCall: #(String LLVMGetValueName2(LLVMValue self, size_t* anInteger))
]

{ #category : #accessing }
LLVMValue >> name [ 

	^ self getNameWithSize: 16
]

{ #category : #accessing }
LLVMValue >> type [ 

	^ self ffiCall: #(LLVMType LLVMTypeOf(LLVMValue self))
]
