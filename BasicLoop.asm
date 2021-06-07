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

RETURN
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
 D=M@SPA=MM=D // SP++@SPM=M+1// ARG -> *SP@ARGD=M@SPA=MM=D// SP++@SPM=M+1// THIS -> *SP@THISD=M@SPA=M M=D// SP++@SPM=M+1// THAT -> *SP@THATD=M @SPA=MM=D// SP++@SPM=M+1// R13 - n -> ARG@R13D=M@1D=D-A@ARGM=D// SP -> LCL@SPD=M@LCLM=D@Main.fibonacci0;JMP(RET.1)
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
 D=M@SPA=MM=D // SP++@SPM=M+1// ARG -> *SP@ARGD=M@SPA=MM=D// SP++@SPM=M+1// THIS -> *SP@THISD=M@SPA=M M=D// SP++@SPM=M+1// THAT -> *SP@THATD=M @SPA=MM=D// SP++@SPM=M+1// R13 - n -> ARG@R13D=M@1D=D-A@ARGM=D// SP -> LCL@SPD=M@LCLM=D@Main.fibonacci0;JMP(RET.1)
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

RETURN
