

	AREA RESET,DATA,READONLY
	EXPORT __Vectors

__Vectors
	
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler	

Reset_Handler
	
	LDR R0, =SRC	
	LDR R1, =N1		
	LDR R2,[r1]		
	LDR R7, =DST
	MOV R8,#0
up	CMP R8,R2
	BEQ out
	ADD R8,#1
	LDR R9,[R0],#4
	STR R9,[R7],#4
	B up
out	LDR R0,=DST
	MOV R1, R0		
	MOV R3,R0		
	MOV R10,#0		
	MOV R11,#0		
lp1	CMP R11, R2		
	BEQ exit		
	ADD R3,R0,#4	
	MOV R1,R0		
	ADD R10,R11,#1	
lp2	CMP R10,R2		
	BEQ oif
	ADD R10,#1		
	LDR R4,[R3],#4
	LDR R5,[R1]
	CMP R5,R4
	BLT lp2
	MOV R1,R3
	SUB R1,#4
	B lp2
oif	ADD R11,#1
	LDR R4,[R0]
	LDR R5,[R1]
	STR R4,[R1]
	STR R5,[R0],#4
	B lp1
exit	
		
STOP 	
	B STOP

N1 DCD 0xA
SRC DCD 0x32,0x63,0x10,0x19,0x28,0x39,0x86,0x67,0x23,0x13
	
	AREA mydata,DATA,READWRITE

DST DCD 0,0,0,0,0,0,0,0,0,0
	END

	