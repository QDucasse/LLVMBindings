Class {
	#name : #LLVMRelocMode,
	#superclass : #FFIEnumeration,
	#classVars : [
		'LLVMRelocDefault',
		'LLVMRelocDynamicNoPic',
		'LLVMRelocPIC',
		'LLVMRelocROPI',
		'LLVMRelocROPI_RWPI',
		'LLVMRelocRWPI',
		'LLVMRelocStatic'
	],
	#category : #'LLVMBindings-Enumeration'
}

{ #category : #'enum declaration' }
LLVMRelocMode class >> enumDecl [

	^ #(
	LLVMRelocDefault      0
	LLVMRelocStatic       1
	LLVMRelocPIC          2
	LLVMRelocDynamicNoPic 3
	LLVMRelocROPI         4
	LLVMRelocRWPI         5
	LLVMRelocROPI_RWPI    6
	)
]
