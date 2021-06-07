//push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

//eq
 @SP 
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@EQ_ 0
 D;JEQ
@SP
A=M
M=0
@INC_0
0;JMP
(EQ_0)
 @SP
 A=M
 M=-1
 (INC_0)
  @SP
 M=M+1
//push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1

//eq
 @SP 
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@EQ_ 1
 D;JEQ
@SP
A=M
M=0
@INC_1
0;JMP
(EQ_1)
 @SP
 A=M
 M=-1
 (INC_1)
  @SP
 M=M+1
//push constant 16
@16
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 17
@17
D=A
@SP
A=M
M=D
@SP
M=M+1

//eq
 @SP 
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=D-M
@EQ_ 2
 D;JEQ
@SP
A=M
M=0
@INC_2
0;JMP
(EQ_2)
 @SP
 A=M
 M=-1
 (INC_2)
  @SP
 M=M+1
//push constant 892
@892
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 891
@891
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
@LT_3
D;JLT
@SP
A=M
M=0
 @INC_3
0;JMP
(LT_ 3)
@SP
A=M
M=-1
(INC_ 3)
@SP
 M=M+1
//push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 892
@892
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
@LT_4
D;JLT
@SP
A=M
M=0
 @INC_4
0;JMP
(LT_ 4)
@SP
A=M
M=-1
(INC_ 4)
@SP
 M=M+1
//push constant 891
@891
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 891
@891
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
@LT_5
D;JLT
@SP
A=M
M=0
 @INC_5
0;JMP
(LT_ 5)
@SP
A=M
M=-1
(INC_ 5)
@SP
 M=M+1
//push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

//gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M 
D=M-D
@GT_6
D;JGT
@SP
A=M 
M=0
@INC_6
0;JMP
(GT_6)
@SP
A=M
M=-1
(INC_6)
@SP
M=M+1
//push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 32767
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1

//gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M 
D=M-D
@GT_7
D;JGT
@SP
A=M 
M=0
@INC_7
0;JMP
(GT_7)
@SP
A=M
M=-1
(INC_7)
@SP
M=M+1
//push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 32766
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1

//gt
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M 
D=M-D
@GT_8
D;JGT
@SP
A=M 
M=0
@INC_8
0;JMP
(GT_8)
@SP
A=M
M=-1
(INC_8)
@SP
M=M+1
//push constant 57
@57
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 31
@31
D=A
@SP
A=M
M=D
@SP
M=M+1

//push constant 53
@53
D=A
@SP
A=M
M=D
@SP
M=M+1

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

//push constant 112
@112
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


 //Neg
@SP
M=M-1
A=M
D=-M
@SP
A=M
M=D
@SP
M=M+1

 //And
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M&D
@SP
A=M
M=D
@SP
M=M+1




//push constant 82
@82
D=A
@SP
A=M
M=D
@SP
M=M+1

 //or
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M|D
@SP
A=M
M=D
@SP
M=M+1



 //Not
@SP
M=M-1
A=M
D=M
@SP
A=M
M=!D
@SP
M=M+1

