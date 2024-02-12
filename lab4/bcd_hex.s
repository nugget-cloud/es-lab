	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000 
	DCD Reset_Handler 
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R1,=NUM
	LDR R2,=RESULT
	MOV R6,#0x0A
	LDRB R3,[R1]
	AND R4,R3,#0x0F
	LSR R5,R3,#4
	MUL R5,R5,R6
	ADD R5,R4
	STRB R5,[R2]
STOP
	B	STOP
NUM DCD 0x0000064
	AREA data, DATA, READWRITE
RESULT DCD 0
	END