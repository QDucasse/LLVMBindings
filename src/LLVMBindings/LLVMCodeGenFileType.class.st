Class {
	#name : #LLVMCodeGenFileType,
	#superclass : #FFIEnumeration,
	#classVars : [
		'LLVMAssemblyFile',
		'LLVMObjectFile'
	],
	#category : #'LLVMBindings-Enumeration'
}

{ #category : #'enum declaration' }
LLVMCodeGenFileType class >> enumDecl [ 

	^ #(
	LLVMAssemblyFile 0
	LLVMObjectFile   1
	)
	

]
