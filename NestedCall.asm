(Sys.init)
@SP
A=M

D=A
@SP
M=D
//push constant 4000	
@4000	
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop pointer 0 
@THIS
D=A

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

//push constant 5000
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop pointer 1
@THAT
D=A

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
@Sys.main
0;JMP
(RET.1)

//pop temp1 
@R5 
D=A 
@ 1
D=D+A 

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

(Sys.init$LOOP)

@Sys.init$LOOP
0;JMP

(Sys.main)
@SP
A=M
M=0
A=A+1
M=0
A=A+1
M=0
A=A+1
M=0
A=A+1
M=0
A=A+1

D=A
@SP
M=D
//push constant 4001
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop pointer 0 
@THIS
D=A

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

//push constant 5001
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop pointer 1
@THAT
D=A

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

//push constant 200
@200
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop local 1
@LCL
D=M
@1
D=D+A

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

//push constant 40
@40
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop local 2
@LCL
D=M
@2
D=D+A

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

//push constant 6
@6
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop local 3
@LCL
D=M
@3
D=D+A

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

//push constant 123
@123
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
@1
D=D-A
@ARG
M=D
// SP -> LCL
@SP
D=M
@LCL
M=D
@Sys.add12
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

//push local 0
@LCL
D=M
@0
A=D+A
D=M

@SP
A=M
M=D
@SP
M=M+1

//push local 1
@LCL
D=M
@1
A=D+A
D=M

@SP
A=M
M=D
@SP
M=M+1

//push local 2
@LCL
D=M
@2
A=D+A
D=M

@SP
A=M
M=D
@SP
M=M+1

//push local 3
@LCL
D=M
@3
A=D+A
D=M

@SP
A=M
M=D
@SP
M=M+1

//push local 4
@LCL
D=M
@4
A=D+A
D=M

@SP
A=M
M=D
@SP
M=M+1

//add
@SP
AM=M-1
D=M
A=A-1
M=D+M

//add
@SP
AM=M-1
D=M
A=A-1
M=D+M

//add
@SP
AM=M-1
D=M
A=A-1
M=D+M

//add
@SP
AM=M-1
D=M
A=A-1
M=D+M

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

(Sys.add12)
@SP
A=M

D=A
@SP
M=D
//push constant 4002
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop pointer 0 
@THIS
D=A

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
    M=D

//push constant 5002
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1

//pop pointer 1
@THAT
D=A

@R13
 M=D
 @SP
  AM=M-1
  D=M
   @R13
   A=M
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

//push constant 12
@12
D=A
@SP
A=M
M=D
@SP
M=M+1

//add
@SP
AM=M-1
D=M
A=A-1
M=D+M

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

