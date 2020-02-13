Class {
	#name : #LLVMRelocMode,
	#superclass : #FFIEnumeration,
	#classVars : [
		'llvmRelocDefault',
		'llvmRelocDynamicNoPic',
		'llvmRelocPIC',
		'llvmRelocROPI',
		'llvmRelocROPI_RWPI',
		'llvmRelocRWPI',
		'llvmRelocStatic'
	],
	#category : #'LLVMBindings-Enumeration'
}

{ #category : #'enum declaration' }
LLVMRelocMode class >> enumDecl [

	^ #(
	llvmRelocDefault      0
	llvmRelocStatic       1
	llvmRelocPIC          2
	llvmRelocDynamicNoPic 3
	llvmRelocROPI         4
	llvmRelocRWPI         5
	llvmRelocROPI_RWPI    6
	)
]
