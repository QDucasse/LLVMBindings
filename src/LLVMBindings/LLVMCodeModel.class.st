Class {
	#name : #LLVMCodeModel,
	#superclass : #FFIEnumeration,
	#classVars : [
		'llvmCodeModelDefault',
		'llvmCodeModelJITDefault',
		'llvmCodeModelKernel',
		'llvmCodeModelLarge',
		'llvmCodeModelMedium',
		'llvmCodeModelSmall',
		'llvmCodeModelTiny',
		'llvmodeModelDefault'
	],
	#category : #'LLVMBindings-Enumeration'
}

{ #category : #'enum declaration' }
LLVMCodeModel class >> enumDecl [

	^ #(
	llvmCodeModelDefault     0
	llvmCodeModelJITDefault 1
	llvmCodeModelTiny       2
	llvmCodeModelSmall      3
	llvmCodeModelKernel     4 
   llvmCodeModelMedium     5
	llvmCodeModelLarge      6
	)
]
