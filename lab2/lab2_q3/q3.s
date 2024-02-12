	AREA reset,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	EXPORT Reset_Handler
	ENTRY
Reset_Handler
	LDR R0,=DST
	MOV R5,#0
	LDR R1,=0x03
	LDR R2,=0x02
	SBC R5,R1,R2
	STR R5,[R0]

STOP
	B STOP
	AREA data, DATA,READWRITE
DST DCD 0x0
	END