(Main.fibonacci)
@SP
A=M

D=A
@SP
M=D
//push argument 0
@0
D=A
@ARG
D=D+M
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1

//push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1

//lt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@LT_0
D;JLT
@SP
A=M
M=0
 @INC_0
0;JMP
(LT_ 0)
@SP
A=M
M=-1
(INC_ 0)
@SP
 M=M+1
@SP
M=M-1
A=M
D=M
@IF_TRUE
D;JNE

@IF_FALSE
0;JMP

(IF_TRUE)

//push argument 0
@0
D=A
@ARG
D=D+M
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1

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

(IF_FALSE)

//push argument 0
@0
D=A
@ARG
D=D+M
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1

//push constant 2
@2
D=A
@SP
A=M
M=D
@SP
M=M+1

 //sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
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
@RET.1
D=A
@SP
A=M
M=D
//SP++
@SP
M=M+1
//LCL -> *SP
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
@SPM=M+1
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
@Main.fibonacci
0;JMP
(RET.1)
//push argument 0
@0
D=A
@ARG
D=D+M
A=D
D=M
@SP
A=M
M=D
@SP
M=M+1

//push constant 1
@1
D=A
@SP
A=M
M=D
@SP
M=M+1

 //sub
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
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
//SP++
@SP
M=M+1
//LCL -> *SP
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
@SPM=M+1
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
@Main.fibonacci
0;JMP
(RET.2)
//add
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D+M
@SP
A=M
M=D
@SP
M=M+1

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
//push constant 4
@4
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
//SP++
@SP
M=M+1
//LCL -> *SP
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
@SPM=M+1
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
@Main.fibonacci
0;JMP
(RET.3)
(WHILE)

@WHILE
0;JMP

