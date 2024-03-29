	AREA reset, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0X10001000 
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R0,=0x3241
	LDR R1,=DST
	MOV R2,#0
	LDR R9,=0xFF
	MOV R5,R0
	MOV R7,#0

UP
	CMP R5,#0
	BEQ EXIT
	
	AND R3,R5,R9
	CMP R3,#0x40
	BCS GREATER
	
	SUB R3,R3,#0x30
	LSR R5,#4
	
	LSL R3,R3,R7
	ADD R2,R2,R3
	ADD R7,#4
	B UP
	
GREATER 
	SUB R3,R3,#0x37
	LSR R5,#8
	LSL R3,R3,R7
	ADD R2,R2,R3
	ADD R7,#4
	B UP
	
EXIT 
	STR R2,[R1]

STOP
	B STOP
	AREA result,DATA,READWRITE
DST DCD 0x0
	END
	