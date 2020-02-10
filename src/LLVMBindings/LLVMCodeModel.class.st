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
		'llvmCodeModelTiny'
	],
	#category : #'LLVMBindings-Enumeration'
}

{ #category : #'enum declaration' }
LLVMCodeModel class >> enumDecl [

	^ #(
	llvmodeModelDefault     0
	llvmCodeModelJITDefault 1
	llvmCodeModelTiny       2
	llvmCodeModelSmall      3
	llvmCodeModelKernel     4 
   llvmCodeModelMedium     5
	llvmCodeModelLarge      6
	)
]
