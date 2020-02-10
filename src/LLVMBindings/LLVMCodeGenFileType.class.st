Class {
	#name : #LLVMCodeGenFileType,
	#superclass : #FFIEnumeration,
	#classVars : [
		'llvmAssemblyFile',
		'llvmObjectFile'
	],
	#category : #'LLVMBindings-Enumeration'
}

{ #category : #'enum declaration' }
LLVMCodeGenFileType class >> enumDecl [ 

	^ #(
	llvmAssemblyFile 0
	llvmObjectFile   1
	)
	

]
