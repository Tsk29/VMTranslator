(SimpleFunction.test)
@SP
A=M
M=0
A=A+1
M=0
A=A+1

D=A
@SP
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

//add
@SP
AM=M-1
D=M
A=A-1
M=D+M

 //Not
@SP
A=M-1
M=!M

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

//add
@SP
AM=M-1
D=M
A=A-1
M=D+M

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

