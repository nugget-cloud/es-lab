	AREA reset,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R1,=DST
	MOV R4,#0
	MOV R2,#1
	MOV R3,#1
	MOV R10,#9
LOOP
	MLA R4,R3,R2,R4
	ADD R3,#1
	SUBS R10,#1
	BNE LOOP
	
	STR R4,[R1]
STOP
	B STOP
	AREA result,DATA,READWRITE
DST DCD 0x0
	END
