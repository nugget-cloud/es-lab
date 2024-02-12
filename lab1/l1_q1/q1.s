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
	MOV R2,#10
LOOP
	LDR R3,[R0],#4
	STR R3,[R1],#4
	SUBS R2,#1
	BNE LOOP
	
STOP
	B STOP
SRC DCD 0x00000011,0x00000012,0x00000013,0x00000014,0x00000015,0x00000016,0x00000017,0x00000018,0x00000019,0x0000001A
	AREA dataset, DATA, READWRITE
DST DCD 0x0
	END