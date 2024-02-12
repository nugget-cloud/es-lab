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
	LDR R0,=N1
	LDR R1,[R0],#04
	LDR R6,=N2
	LDR R2,[R6],#04
	LDR R5,=RES
	SUBS R4,R1,R2
	LDR R1,[R0],#04
	LDR R2,[R6],#04
	STR R4,[R5],#04
	SBCS R4,R1,R2
	LDR R1,[R0],#04
	LDR R2,[R6],#04
	STR R4,[R5],#04
	SBCS R4,R1,R2
	LDR R1,[R0],#04
	LDR R2,[R6],#04
	STR R4,[R5],#04
	SBCS R4,R1,R2
	LDR R1,[R0],#04
	LDR R2,[R6],#04
	STR R4,[R5],#04
STOP
	B STOP
N1 DCD 0x187FC5A7,0x8D33CD38,0x9FAB89A2,0xA257C902 
N2 DCD 0xAFCB6BFD,0x3992F81C,0xC9E69770,0x66ECCC79
	AREA mydata, DATA, READWRITE
RES DCD 0
	END