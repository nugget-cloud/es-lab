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
	LDR R0,=SRC
	LDR R1,=DST
	LDR R5, =0x00000000
	MOV R2,#10
LOOP
	LDR R3, [R0], #4
	ADD R5,R3
	SUBS R2,#1
	BNE LOOP
	
	STR R5, [R1]
STOP 
	B STOP
SRC DCD 0x00000011,0x00000012,0x00000013,0x00000014,0x00000015,0x00000016,0x00000017,0x00000018,0x00000019,0x0000001A
	AREA result,DATA,READWRITE
DST DCD 0x0
	END