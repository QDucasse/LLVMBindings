# LLVMBindings
LLVM C bindings from Pharo (https://llvm.org/doxygen/group__LLVMC.html).

Repository for the C source code: https://github.com/QDucasse/LLVM-C
Repository for the booklet and tutorial: https://github.com/SquareBracketAssociates/Booklet-LLVMCompilationWithPharo

# Example of usage

---
The following code corresponds to the tutorial described in the booklet. It consists of the creation of a `sum` function in LLVM intermediate representation (IR).

## Enumeration initialisation

---

External enumerations have to be initialised at the start. The three main enumerations



## Module definition

---

The base "object" of the LLVM IR is a **module**. It will hold all the next objects and works as a placeholder.

```
  mod := LLVMModule withName: 'mod'.
```

## Parameters Array Definition

---

The function we aim to create is a function with signature would look like `sum(number1,number2)`. In order to create a proper LLVM function representation, we need to define its parameter array first. We create it by specifying the type of each argument add then put it at the correct place.

```
  paramArray := LLVMParameterArray withSize: 2.
  t1 := LLVMInt32 create handle getHandle.
  t2 := LLVMInt32 create handle getHandle.
  paramArray at: 1 put: t1.
  paramArray at: 2 put: t2.
```

## Parameters Array Definition

---

The function signature can be created from the previously defined parameter array, the return type of the function's output, the function's arity and an indication on whether or not it is varidic (accepts a variable number of arguments).
```
  retType := LLVMInt32 create.
  sumSig := LLVMFunctionSignature withReturnType: retType parametersVector: paramArray arity: 2 andIsVariadic: false.
```

## Function Definition

---

From the function signature, we can create a memory representation of the function. The `LLVMFunction` object corresponds to this representation and can be created by adding the previously defined function signature to the top-level module.

```
  sum := sumSig addToModule: mod withName: 'sum'.
```

## Basic Block creation

---

A basic block corresponds to a series of instructions that will be executed in the given order successively with no possible escape (an `if-then-else` would require several basic blocks to be properly translated). Every function needs an `entry` basic block. In our function and since it is simple enough, this `entry` block will take care of the whole function.

```
  block := LLVMBasicBlock appendToFunction: sum withName: 'entry'.
```

## Builder Creation and Usage

The builder (short for *Instruction Builder*) is the LLVM element that will write the final machine instructions in LLVM IR. The builder can be positioned at the end of a basic block or after a given instruction. Here, we will place the builder at the end of our `entry` block in the `sum` function.

```
  builder := LLVMBuilder create.
  builder positionBuilderAtEndOfBasicBlock: block.
```

Next we need to get the actual values provided to the function and perform the `ADD` instruction. Due to LLVM IR restrictions, *every temporary variable has to have a unique name*. We finally build the `return` value of the `sum` function, being the result of the two added parameters.

```
  param1 := sum parameterAtIndex: 0.
  param2 := sum parameterAtIndex: 1.
  tmp := builder buildAdd: param1 getHandle to: param2 getHandle andStoreUnder: 'tmp'.
  builder buildReturnStatementFromValue: tmp.
```

## Target Machine Code Emission

---

LLVM uses a system of `Triple`, `Target` and `TargetMachine` to specify a given architecture. The `Triple` is the textual representation and consists of three concatenated strings: <architecture>-<vendor>-<system>. In our case, we will use `x86_64`, providing default vendor and system. The `Target` has to be initialised and defined as follows:

```
  LLVMTarget initializeX86.
  target := LLVMTarget getTargetFromTriple: 'x86_64'.
```

Next, the `TargetMachine` can be derived from the `Target`.
```
  targetMachine := LLVMTargetMachine fromTarget: target withTriple: 'x86_64'.
```

Finally, we can emit the `OBJ` or `ASM` version of our function's LLVM IR by emitting the module to a memory buffer.
```
  memBuffASM := mod emitASMFromTargetMachine: targetMachine.
  memBuffObj := mod emitObjFromTargetMachine: targetMachine.
```
