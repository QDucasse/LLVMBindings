Class {
	#name : #LLVMCodeGenOptLevel,
	#superclass : #FFIEnumeration,
	#classVars : [
		'LLVMCodeGenLevelAggressive',
		'LLVMCodeGenLevelDefault',
		'LLVMCodeGenLevelLess',
		'LLVMCodeGenLevelNone'
	],
	#category : #'LLVMBindings-Enumeration'
}

{ #category : #'enum declaration' }
LLVMCodeGenOptLevel class >> enumDecl [ 

	^ #(
	LLVMCodeGenLevelNone       0
	LLVMCodeGenLevelLess       1
	LLVMCodeGenLevelDefault    2
	LLVMCodeGenLevelAggressive 3 
	)
	


]
