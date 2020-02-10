Class {
	#name : #LLVMTargetMachine,
	#superclass : #FFIExternalObject,
	#pools : [
		'LLVMCodeGenFileType',
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
LLVMTargetMachine class >> fromTarget: aTarget withTriple: aTripleString withCPU: aCPUString withFeatures: aFeaturesString withOptLevel: anOptimizationLevel withRelocMode: aRelocMode andCodeModel: aCodeModel [

	self ffiCall: #(LLVMTargetMachine LLVMCreateTargetMachine(LLVMTarget aTarget,
										              String 	              aTripleString,
                                             String 	              aCPUString,
														  String 	              aFeaturesString,
														  LLVMCodeGenOptLevel  anOptimizationLevel,
													     LLVMRelocMode        aRelocMode,
                  									  LLVMCodeModel 	     aCodeModel ))
]

{ #category : #resources }
LLVMTargetMachine >> cpu [ 

	^ self ffiCall: #(String LLVMGetTargetMachineCPU(self))
]

{ #category : #resources }
LLVMTargetMachine >> dispose [


	self ffiCall: #(vois LLVMDisposeTargetMachine(self))
]

{ #category : #resources }
LLVMTargetMachine >> featureString [

	^ self ffiCall: #(String LLVMGetTargetMachineFeatureString(self))
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

	^ self ffiCall: #(String LLVMGetTargetMachineTarget(self))
]

{ #category : #resources }
LLVMTargetMachine >> triple [

	^ self ffiCall: #(String LLVMGetTargetMachineTriple(self))
]
