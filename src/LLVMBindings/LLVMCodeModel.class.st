Class {
	#name : #LLVMCodeModel,
	#superclass : #FFIEnumeration,
	#classVars : [
		'LLVMCodeModelDefault',
		'LLVMCodeModelJITDefault',
		'LLVMCodeModelKernel',
		'LLVMCodeModelLarge',
		'LLVMCodeModelMedium',
		'LLVMCodeModelSmall',
		'LLVMCodeModelTiny'
	],
	#category : #'LLVMBindings-Enumeration'
}

{ #category : #'enum declaration' }
LLVMCodeModel class >> enumDecl [

	^ #(
	LLVMCodeModelDefault    0
	LLVMCodeModelJITDefault 1
	LLVMCodeModelTiny       2
	LLVMCodeModelSmall      3
	LLVMCodeModelKernel     4 
   LLVMCodeModelMedium     5
	LLVMCodeModelLarge      6
	)
]
