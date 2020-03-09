"
I represent a module in the LLVM library. A module is the top container of everything LLVM defines and creates.

See my class side for initialization methods.

 
"
Class {
	#name : #LLVMModule,
	#superclass : #FFIExternalObject,
	#classVars : [
		'LLVMMemBuffer_PTR',
		'String_PTR'
	],
	#pools : [
		'LLVMCodeGenFileType'
	],
	#category : #'LLVMBindings-Core'
}

{ #category : #'instance creation' }
LLVMModule class >> ffiLibrary [

	^ 'libLLVM.dylib' asFFILibrary
]

{ #category : #'instance creation' }
LLVMModule class >> initialize [

	String_PTR := FFIExternalValueHolder ofType: 'String'.
	LLVMMemBuffer_PTR := FFIExternalValueHolder ofType: 'LLVMMemoryBuffer'.
]

{ #category : #'instance creation' }
LLVMModule class >> withName: aName [

	self initialize.
	^ self ffiCall: #(LLVMModule LLVMModuleCreateWithName(String aName))
]

{ #category : #finalization }
LLVMModule >> dispose [

	self ffiCall: #(void LLVMDisposeModule(LLVMModule self))
]

{ #category : #finalization }
LLVMModule >> emitASMFromTargetMachine: aTargetMachine [

	^ self emitCodeFromTargetMachine: aTargetMachine withFileType: llvmAssemblyFile 

]

{ #category : #finalization }
LLVMModule >> emitBitCodeToMemoryBuffer [

	^ self ffiCall: #(LLVMMemoryBuffer LLVMWriteBitcodeToMemoryBuffer(LLVMModule self))
]

{ #category : #finalization }
LLVMModule >> emitCodeFromTargetMachine: aTargetMachine toMemoryBuffer: aMemBufferPtr withFileType: aCodeFileType withError: anErrorHolder [

	^ self ffiCall: #(Boolean LLVMTargetMachineEmitToMemoryBuffer(LLVMTargetMachine aTargetMachine,
																					 LLVMModule self,
																					 LLVMCodeGenFileType aCodeFileType,
																					 String_PTR anErrorHolder,
																					 LLVMMemBuffer_PTR aMemBufferPtr))
]

{ #category : #finalization }
LLVMModule >> emitCodeFromTargetMachine: aTargetMachine withFileType: aCodeFileType [ 

	| memBufferHolder errorHolder hasError |

    memBufferHolder := LLVMMemBuffer_PTR new.
    errorHolder := String_PTR new.

	"Returns 0 (false) on success"
    hasError := self emitCodeFromTargetMachine: aTargetMachine toMemoryBuffer: memBufferHolder withFileType: aCodeFileType withError: errorHolder.
    hasError ifTrue: [ self error: errorHolder value ].
   
    ^ LLVMMemoryBuffer fromHandle: memBufferHolder value.
]

{ #category : #finalization }
LLVMModule >> emitObjFromTargetMachine: aTargetMachine [

	^ self emitCodeFromTargetMachine: aTargetMachine withFileType: llvmObjectFile 

]

{ #category : #finalization }
LLVMModule >> ffiLibrary [

	^ self class ffiLibrary
]

{ #category : #finalization }
LLVMModule >> finalize [ 

	self dispose
]

{ #category : #finalization }
LLVMModule >> target [

	^ self ffiCall: #(const char *LLVMGetTarget(LLVMModule self))
]

{ #category : #finalization }
LLVMModule >> target: aTriple [

	self ffiCall: #(void LLVMSetTarget(LLVMModule self, String aTriple))
]
