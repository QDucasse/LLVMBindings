"
I represent a compilation/disassembly target in the LLVM library.
The targets required to work with should be initialized to be available in LLVM.

See my class side for initialization methods. For example, the following methods initialize x86 (32 and 64 bits), arm 32 bits and arm 64 bits.

LLVMTarget initializeX86.
LLVMTarget initializeARM.
LLVMTarget initializeARM64.
"
Class {
	#name : #LLVMTarget,
	#superclass : #FFIExternalObject,
	#classVars : [
		'LLVMTarget_PTR',
		'String_PTR'
	],
	#category : #'LLVMBindings-Target'
}

{ #category : #accessing }
LLVMTarget class >> ffiLibrary [

	^ 'libLLVM.dylib' asFFILibrary
]

{ #category : #accessing }
LLVMTarget class >> firstTarget [

	^ self ffiCall: #(LLVMTarget LLVMGetFirstTarget(void))
]

{ #category : #accessing }
LLVMTarget class >> getTargetFromTriple: triple [
    | targetHolder errorHolder haveError |

    targetHolder := LLVMTarget_PTR new.
    errorHolder := String_PTR new.

    "Returns 0 (false) on sucess"
    haveError := LLVMTarget getTargetIn: targetHolder fromTriple: triple errorMessage: errorHolder.
    haveError ifTrue: [ self error: errorHolder value ].
   
    ^ LLVMTarget fromHandle: targetHolder value.
]

{ #category : #accessing }
LLVMTarget class >> getTargetIn: targetHolder fromTriple: triple errorMessage: errorHolder [

    ^ self ffiCall: #(Boolean LLVMGetTargetFromTriple(const char* triple,
                                                      LLVMTarget_PTR targetHolder,
                                                      String_PTR errorHolder))
]

{ #category : #accessing }
LLVMTarget class >> initialize [
   
    LLVMTarget_PTR := FFIExternalValueHolder ofType: 'LLVMTarget'.
    String_PTR := FFIExternalValueHolder ofType: 'String'.
]

{ #category : #accessing }
LLVMTarget class >> initializeAArch64 [

	self initialize.
	self initializeAArch64Target.
	self initializeAArch64TargetInfo.
	self initializeAArch64TargetMC.
	self initializeAArch64AsmPrinter.
]

{ #category : #accessing }
LLVMTarget class >> initializeAArch64AsmPrinter [

	self ffiCall: #(void LLVMInitializeAArch64AsmPrinter())
]

{ #category : #accessing }
LLVMTarget class >> initializeAArch64Target [

	self ffiCall: #(void LLVMInitializeAArch64Target())
]

{ #category : #accessing }
LLVMTarget class >> initializeAArch64TargetInfo [

	self ffiCall: #(void LLVMInitializeAArch64TargetInfo())
]

{ #category : #accessing }
LLVMTarget class >> initializeAArch64TargetMC [

	self ffiCall: #(void LLVMInitializeAArch64TargetMC())
]

{ #category : #accessing }
LLVMTarget class >> initializeARM [

	self initialize.
	self initializeARMTarget.
	self initializeARMTargetInfo.
	self initializeARMTargetMC.
	self initializeARMAsmPrinter.
]

{ #category : #accessing }
LLVMTarget class >> initializeARMAsmPrinter [

	self ffiCall: #(void LLVMInitializeARMAsmPrinter())
]

{ #category : #accessing }
LLVMTarget class >> initializeARMTarget [

	self ffiCall: #(void LLVMInitializeARMTarget())
]

{ #category : #accessing }
LLVMTarget class >> initializeARMTargetInfo [

	self ffiCall: #(void LLVMInitializeARMTargetInfo())
]

{ #category : #accessing }
LLVMTarget class >> initializeARMTargetMC [

	self ffiCall: #(void LLVMInitializeARMTargetMC())
]

{ #category : #accessing }
LLVMTarget class >> initializeX86 [

	self initialize.
	self initializeX86Target.
	self initializeX86TargetInfo.
	self initializeX86TargetMC.
	self initializeX86AsmPrinter.
]

{ #category : #accessing }
LLVMTarget class >> initializeX86AsmPrinter [

	self ffiCall: #(void LLVMInitializeX86AsmPrinter())
]

{ #category : #accessing }
LLVMTarget class >> initializeX86Target [

	self ffiCall: #(void LLVMInitializeX86Target())
]

{ #category : #accessing }
LLVMTarget class >> initializeX86TargetInfo [

	self ffiCall: #(void LLVMInitializeX86TargetInfo())
]

{ #category : #accessing }
LLVMTarget class >> initializeX86TargetMC [

	self ffiCall: #(void LLVMInitializeX86TargetMC())
]

{ #category : #accessing }
LLVMTarget >> description [

	^ self ffiCall: #(const char *LLVMGetTargetDescription(LLVMTarget self))
]

{ #category : #resources }
LLVMTarget >> ffiLibrary [

	^ self class ffiLibrary
]

{ #category : #accessing }
LLVMTarget >> name [

	^ self ffiCall: #(const char *LLVMGetTargetName(LLVMTarget self))
]

{ #category : #accessing }
LLVMTarget >> next [

	^ self ffiCall: #(LLVMTarget LLVMGetNextTarget(LLVMTarget self))
]
