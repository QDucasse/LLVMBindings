Class {
	#name : #LLVMBasicBlockTest,
	#superclass : #TestCase,
	#category : #'LLVMBindings-Tests'
}

{ #category : #tests }
LLVMBasicBlockTest >> testNameIsSetAndRead [

	| cont bb |
	cont := LLVMContext create.
	bb := LLVMBasicBlock createInContext: cont withName: 'root'.
	self assert: bb name equals: 'root'
]

{ #category : #tests }
LLVMBasicBlockTest >> testNoParentShoulsSendEmptyValue [

	| cont bb |
	cont := LLVMContext create.
	bb := LLVMBasicBlock createInContext: cont withName: 'root'.
	self assert: bb parent printString equals: 'a LLVMValue((void*)@ 16r00000000)'
]
