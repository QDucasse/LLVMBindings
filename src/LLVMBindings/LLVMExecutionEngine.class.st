Class {
	#name : #LLVMExecutionEngine,
	#superclass : #FFIExternalObject,
	#classVars : [
		'LLVMExecutionEngine_PTR',
		'LLVMFunction_PTR',
		'String_PTR'
	],
	#category : #'LLVMBindings-Core'
}

{ #category : #'as yet unclassified' }
LLVMExecutionEngine class >> createForModule: module [
    | engineHolder errorHolder hasError |
	
	 self initialize.
    engineHolder := LLVMExecutionEngine_PTR new.
    errorHolder := String_PTR new.

    "Returns 0 (false) on success"
    hasError := LLVMExecutionEngine getEngineIn: engineHolder forModule: module errorMessage: errorHolder.
    hasError ifTrue: [ self error: errorHolder value ].

	^ LLVMExecutionEngine fromHandle: engineHolder value.
]

{ #category : #resources }
LLVMExecutionEngine class >> ffiLibrary [

	^ LLVMLibrary
]

{ #category : #'as yet unclassified' }
LLVMExecutionEngine class >> getEngineIn: engineHolder forModule: moduleName errorMessage: errorHolder [

	^ self ffiCall: #(Boolean LLVMCreateExecutionEngineForModule(LLVMExecutionEngine_PTR engineHolder,
																				   LLVMModule moduleName,
																					String_PTR errorHolder))
]

{ #category : #initialization }
LLVMExecutionEngine class >> initialize [ 

    LLVMExecutionEngine_PTR := FFIExternalValueHolder ofType: 'LLVMExecutionEngine'.
    String_PTR := FFIExternalValueHolder ofType: 'String'.
	LLVMFunction_PTR := FFIExternalValueHolder ofType: 'LLVMFunction'.
]

{ #category : #resources }
LLVMExecutionEngine >> ffiLibrary [

	^ self class ffiLibrary
]

{ #category : #initialization }
LLVMExecutionEngine >> finalize [ 

	self ffiCall: #(void LLVMDisposeExecutionEngine(LLVMExecutionEngine self))
]

{ #category : #initialization }
LLVMExecutionEngine >> findFunctionFromName: name [ 

    | functionHolder hasError |

    functionHolder := LLVMFunction_PTR new.

    "Returns 0 (false) on success"
    hasError := self getFunctionIn: functionHolder fromName: name.
    hasError ifTrue: [ self error: 'Function not found' ].

	^ LLVMFunction fromHandle: functionHolder value
]

{ #category : #initialization }
LLVMExecutionEngine >> getFunctionAddress: functionName [

	^ self ffiCall: #(uint64 LLVMGetFunctionAddress(LLVMExecutionEngine self,
																  String functionName))
]

{ #category : #initialization }
LLVMExecutionEngine >> getFunctionIn: functionHolder fromName: name [ 

	^ self ffiCall: #(Boolean LLVMFindFunction(LLVMExecutionEngine self,
															String name,
															LLVMFunction_PTR functionHolder))
]
