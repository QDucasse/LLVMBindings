Class {
	#name : #LLVMCodeGenOptLevel,
	#superclass : #FFIEnumeration,
	#classVars : [
		'llvmCodeGenLevelAggressive',
		'llvmCodeGenLevelDefault',
		'llvmCodeGenLevelLess',
		'llvmCodeGenLevelNone'
	],
	#category : #'LLVMBindings-Enumeration'
}

{ #category : #'enum declaration' }
LLVMCodeGenOptLevel class >> enumDecl [ 

	^ #(
	llvmCodeGenLevelNone       0
	llvmCodeGenLevelLess       1
	llvmCodeGenLevelDefault    2
	llvmCodeGenLevelAggressive 3 
	)
	


]
