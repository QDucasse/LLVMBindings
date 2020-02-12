"
I represent a module in the LLVM library. A module is the top container of everything LLVM defines and creates.

See my class side for initialization methods.

 
"
Class {
	#name : #LLVMModule,
	#superclass : #FFIExternalObject,
	#category : #'LLVMBindings-Core'
}

{ #category : #'instance creation' }
LLVMModule class >> ffiLibrary [

	^ 'libLLVM.dylib' asFFILibrary
]

{ #category : #'instance creation' }
LLVMModule class >> withName: aName [

	^ self ffiCall: #(LLVMModule LLVMModuleCreateWithName(String aName))
]

{ #category : #finalization }
LLVMModule >> dispose [

	self ffiCall: #(void LLVMDisposeModule(LLVMModule self))
]

{ #category : #finalization }
LLVMModule >> emitBitCodeToMemoryBuffer [

	^ self ffiCall: #(LLVMMemoryBuffer LLVMWriteBitcodeToMemoryBuffer(LLVMModule self))
]

{ #category : #finalization }
LLVMModule >> emitTargetMachineCode: aTargetMachine toMemoryBuffer: aMemBufferPtr withFileType: aCodeFileType withError: anErrorHolder [

	^ self ffiCall: #(Boolean LLVMTargetMachineEmitToMemoryBuffer(LLVMTargetMachine aTargetMachine,
																					 LLVMModule self,
																					 LLVMCodeGenFileType aCodeFileType,
																					 char** anErrorHolder,
																					 LLVMMemoryBuffer* aMemBufferPtr))
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
