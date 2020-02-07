Class {
	#name : #BaselineOfLLVMBindings,
	#superclass : #BaselineOf,
	#category : #BaselineOfLLVMBindings
}

{ #category : #accessing }
BaselineOfLLVMBindings >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			spec package: 'LLVMBindings' ]
]

{ #category : #accessing }
BaselineOfLLVMBindings >> project [

	^ super project
		loadType: #atomic;
		yourself
]
