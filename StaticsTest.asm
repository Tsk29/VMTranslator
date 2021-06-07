@256
D=A
@SP
M=D
// call Sys.init 0

  // SP -> R13
@SP
D=M
@R13
M=D
// @RET -> *SP
@RET.1
D=A
@SP
A=M
M=D
// SP++
@SP
M=M+1
// LCL -> *SP
@LCL
D=M
@SP
A=M
M=D
// SP++
@SP
M=M+1
 // ARG -> *SP
@ARG
D=M
@SP
A=M
M=D
 // SP++
@SP
M=M+1
 // THIS -> *SP
@THIS
D=M
@SP
A=M
M=D
 // SP++
@SP
M=M+1
// THAT -> *SP
@THAT
D=M
@SP
A=M
M=D
// SP++
@SP
M=M+1
// R13 - n -> ARG
@R13
D=M
@0
D=D-A
@ARG
M=D
// SP -> LCL
@SP
D=M
@LCL
M=D
@Sys.init
0;JMP
(RET.1)

0;JMP

(Class1.set)
@SP
A=M

D=A
@SP
M=D
//push argument 0
@ARG
D=M
@0
A=D+A
D=M

@SP
A=M
M=D
@SP
M=M+1

@Class1.vm.0
D=A

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

//push argument 1
@ARG
D=M
@1
A=D+A
D=M

@SP
A=M
M=D
@SP
M=M+1

@Class1.vm.1
D=A

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

//push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

//RETURN
// *(LCL - 5) -> R13
@LCL
D=M
@5
A=D-A
D=M
@R13
M=D
// *(SP - 1) -> *ARG
@SP
A=M-1
D=M
@ARG
A=M
M=D 
// ARG + 1 -> SP
D=A+1
@SP
M=D
// *(LCL - 1) -> THAT; LCL--
@LCL
AM=M-1
D=M
@THAT
M=D
 // *(LCL - 1) -> THIS; LCL--
@LCL
AM=M-1
D=M
@THIS
M=D
// *(LCL - 1) -> ARG; LCL--
@LCL
AM=M-1
D=M
@ARG
M=D
 // *(LCL - 1) -> LCL
@LCL
A=M-1
D=M
@LCL
M=D
// R13 -> A
@R13
A=M
0;JMP

(Class1.get)
@SP
A=M

D=A
@SP
M=D
@Class1.vm.0
D=M

@SP
A=M
M=D
@SP
M=M+1

@Class1.vm.1
D=M

@SP
A=M
M=D
@SP
M=M+1

 //sub
@SP
AM=M-1
D=M
A=A-1
M=M-D


//RETURN
// *(LCL - 5) -> R13
@LCL
D=M
@5
A=D-A
D=M
@R13
M=D
// *(SP - 1) -> *ARG
@SP
A=M-1
D=M
@ARG
A=M
M=D 
// ARG + 1 -> SP
D=A+1
@SP
M=D
// *(LCL - 1) -> THAT; LCL--
@LCL
AM=M-1
D=M
@THAT
M=D
 // *(LCL - 1) -> THIS; LCL--
@LCL
AM=M-1
D=M
@THIS
M=D
// *(LCL - 1) -> ARG; LCL--
@LCL
AM=M-1
D=M
@ARG
M=D
 // *(LCL - 1) -> LCL
@LCL
A=M-1
D=M
@LCL
M=D
// R13 -> A
@R13
A=M
0;JMP

(Class2.set)
@SP
A=M

D=A
@SP
M=D
//push argument 0
@ARG
D=M
@0
A=D+A
D=M

@SP
A=M
M=D
@SP
M=M+1

@Class2.vm.0
D=A

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

//push argument 1
@ARG
D=M
@1
A=D+A
D=M

@SP
A=M
M=D
@SP
M=M+1

@Class2.vm.1
D=A

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

//push constant 0
@0
D=A
@SP
A=M
M=D
@SP
M=M+1

//RETURN
// *(LCL - 5) -> R13
@LCL
D=M
@5
A=D-A
D=M
@R13
M=D
// *(SP - 1) -> *ARG
@SP
A=M-1
D=M
@ARG
A=M
M=D 
// ARG + 1 -> SP
D=A+1
@SP
M=D
// *(LCL - 1) -> THAT; LCL--
@LCL
AM=M-1
D=M
@THAT
M=D
 // *(LCL - 1) -> THIS; LCL--
@LCL
AM=M-1
D=M
@THIS
M=D
// *(LCL - 1) -> ARG; LCL--
@LCL
AM=M-1
D=M
@ARG
M=D
 // *(LCL - 1) -> LCL
@LCL
A=M-1
D=M
@LCL
M=D
// R13 -> A
@R13
A=M
0;JMP

(Class2.get)
@SP
A=M

D=A
@SP
M=D
@Class2.vm.0
D=M

@SP
A=M
M=D
@SP
M=M+1

@Class2.vm.1
D=M

@SP
A=M
M=D
@SP
M=M+1

 //sub
@SP
AM=M-1
D=M
A=A-1
M=M-D


//RETURN
// *(LCL - 5) -> R13
@LCL
D=M
@5
A=D-A
D=M
@R13
M=D
// *(SP - 1) -> *ARG
@SP
A=M-1
D=M
@ARG
A=M
M=D 
// ARG + 1 -> SP
D=A+1
@SP
M=D
// *(LCL - 1) -> THAT; LCL--
@LCL
AM=M-1
D=M
@THAT
M=D
 // *(LCL - 1) -> THIS; LCL--
@LCL
AM=M-1
D=M
@THIS
M=D
// *(LCL - 1) -> ARG; LCL--
@LCL
AM=M-1
D=M
@ARG
M=D
 // *(LCL - 1) -> LCL
@LCL
A=M-1
D=M
@LCL
M=D
// R13 -> A
@R13
A=M
0;JMP

(Sys.init)
@SP
A=M

D=A
@SP
M=D
//push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 8
@8
D=A
@SP
A=M
M=D
@SP
M=M+1

  // SP -> R13
@SP
D=M
@R13
M=D
// @RET -> *SP
@RET.2
D=A
@SP
A=M
M=D
// SP++
@SP
M=M+1
// LCL -> *SP
@LCL
D=M
@SP
A=M
M=D
// SP++
@SP
M=M+1
 // ARG -> *SP
@ARG
D=M
@SP
A=M
M=D
 // SP++
@SP
M=M+1
 // THIS -> *SP
@THIS
D=M
@SP
A=M
M=D
 // SP++
@SP
M=M+1
// THAT -> *SP
@THAT
D=M
@SP
A=M
M=D
// SP++
@SP
M=M+1
// R13 - n -> ARG
@R13
D=M
@2
D=D-A
@ARG
M=D
// SP -> LCL
@SP
D=M
@LCL
M=D
@Class1.set
0;JMP
(RET.2)

//pop temp0 
@R5 
D=A 
@ 0
D=D+A 

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

//push constant 23
@23
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 15
@15
D=A
@SP
A=M
M=D
@SP
M=M+1

  // SP -> R13
@SP
D=M
@R13
M=D
// @RET -> *SP
@RET.3
D=A
@SP
A=M
M=D
// SP++
@SP
M=M+1
// LCL -> *SP
@LCL
D=M
@SP
A=M
M=D
// SP++
@SP
M=M+1
 // ARG -> *SP
@ARG
D=M
@SP
A=M
M=D
 // SP++
@SP
M=M+1
 // THIS -> *SP
@THIS
D=M
@SP
A=M
M=D
 // SP++
@SP
M=M+1
// THAT -> *SP
@THAT
D=M
@SP
A=M
M=D
// SP++
@SP
M=M+1
// R13 - n -> ARG
@R13
D=M
@2
D=D-A
@ARG
M=D
// SP -> LCL
@SP
D=M
@LCL
M=D
@Class2.set
0;JMP
(RET.3)

//pop temp0 
@R5 
D=A 
@ 0
D=D+A 

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

  // SP -> R13
@SP
D=M
@R13
M=D
// @RET -> *SP
@RET.4
D=A
@SP
A=M
M=D
// SP++
@SP
M=M+1
// LCL -> *SP
@LCL
D=M
@SP
A=M
M=D
// SP++
@SP
M=M+1
 // ARG -> *SP
@ARG
D=M
@SP
A=M
M=D
 // SP++
@SP
M=M+1
 // THIS -> *SP
@THIS
D=M
@SP
A=M
M=D
 // SP++
@SP
M=M+1
// THAT -> *SP
@THAT
D=M
@SP
A=M
M=D
// SP++
@SP
M=M+1
// R13 - n -> ARG
@R13
D=M
@0
D=D-A
@ARG
M=D
// SP -> LCL
@SP
D=M
@LCL
M=D
@Class1.get
0;JMP
(RET.4)

  // SP -> R13
@SP
D=M
@R13
M=D
// @RET -> *SP
@RET.5
D=A
@SP
A=M
M=D
// SP++
@SP
M=M+1
// LCL -> *SP
@LCL
D=M
@SP
A=M
M=D
// SP++
@SP
M=M+1
 // ARG -> *SP
@ARG
D=M
@SP
A=M
M=D
 // SP++
@SP
M=M+1
 // THIS -> *SP
@THIS
D=M
@SP
A=M
M=D
 // SP++
@SP
M=M+1
// THAT -> *SP
@THAT
D=M
@SP
A=M
M=D
// SP++
@SP
M=M+1
// R13 - n -> ARG
@R13
D=M
@0
D=D-A
@ARG
M=D
// SP -> LCL
@SP
D=M
@LCL
M=D
@Class2.get
0;JMP
(RET.5)

(Sys.init$WHILE)

@Sys.init$WHILE
0;JMP

