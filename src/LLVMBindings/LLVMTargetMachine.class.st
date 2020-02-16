Class {
	#name : #LLVMTargetMachine,
	#superclass : #FFIExternalObject,
	#pools : [
		'LLVMCodeGenOptLevel',
		'LLVMCodeModel',
		'LLVMRelocMode'
	],
	#category : #'LLVMBindings-Target'
}

{ #category : #'instance creation' }
LLVMTargetMachine class >> ffiLibrary [

	^ 'libLLVM.dylib' asFFILibrary
]

{ #category : #'instance creation' }
LLVMTargetMachine class >> fromTarget: aTarget withTriple: aTripleString [ 

	^ LLVMTargetMachine fromTarget: aTarget withTriple: aTripleString withCPU: '' withFeatures: '' withOptLevel: llvmCodeGenLevelDefault withRelocMode: llvmRelocDefault andCodeModel: llvmCodeModelDefault

]

{ #category : #'instance creation' }
LLVMTargetMachine class >> fromTarget: aTarget withTriple: aTripleString withCPU: aCPUString withFeatures: aFeaturesString withOptLevel: anOptimizationLevel withRelocMode: aRelocMode andCodeModel: aCodeModel [

	^ self ffiCall: #(LLVMTargetMachine LLVMCreateTargetMachine(LLVMTarget aTarget,
										              String 	              aTripleString,
                                             String 	              aCPUString,
														  String 	              aFeaturesString,
														  LLVMCodeGenOptLevel  anOptimizationLevel,
													     LLVMRelocMode        aRelocMode,
                  									  LLVMCodeModel 	     aCodeModel ))
]

{ #category : #resources }
LLVMTargetMachine >> cpu [ 

	^ self ffiCall: #(String LLVMGetTargetMachineCPU(LLVMTargetMachine self))
]

{ #category : #resources }
LLVMTargetMachine >> dispose [

	self ffiCall: #(void LLVMDisposeTargetMachine(LLVMTargetMachine self))
]

{ #category : #resources }
LLVMTargetMachine >> featureString [

	^ self ffiCall: #(String LLVMGetTargetMachineFeatureString(LLVMTargetMachine self))
]

{ #category : #resources }
LLVMTargetMachine >> ffiLibrary [

	^ self class ffiLibrary
]

{ #category : #resources }
LLVMTargetMachine >> finalize [ 

	self dispose
]

{ #category : #resources }
LLVMTargetMachine >> target [

	^ self ffiCall: #(LLVMTarget LLVMGetTargetMachineTarget(LLVMTargetMachine self))
]

{ #category : #resources }
LLVMTargetMachine >> triple [

	^ self ffiCall: #(String LLVMGetTargetMachineTriple(LLVMTargetMachine self))
]
