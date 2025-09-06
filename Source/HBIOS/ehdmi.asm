;======================================================================
;	I/O DRIVER FOR eZ80 managed CRT INTERFACE
;  Super HDMI (Tang Nano 20K)
;  USB or UART for input
;
;======================================================================
;
; On boot initialisation, if no USB keyboard detected, the driver defaults
; to using the eZ80's UART input stream as keyboard equivalent.
; This driver is only supported for the eZ80 platform
;
VDP_TMS			.EQU	1
VDP_V9938		.EQU	2
VDP_V9958		.EQU	3
VDP_SUPER		.EQU	4
MAX_NUMBER_OF_DEVICES	.EQU	6

USB_NOT_SUPPORTED	.EQU	0
USB_IS_FLOPPY		.EQU	1
USB_IS_MASS_STORAGE	.EQU	2
USB_IS_CDC		.EQU	3
USB_IS_KEYBOARD		.EQU	4
USB_IS_UNKNOWN		.EQU	6
USB_IS_HUB		.EQU	15
;
;

USBKYBENABLE		.SET	TRUE		; INCLUDE USB KEYBOARD SUPPORT
	DEVECHO	"HMDI-USB-KYB"

;======================================================================
; DRIVER - INITIALIZATION
;======================================================================
;
EHDMI_INIT:
	LD	IY, 0		; POINTER TO INSTANCE DATA
;
	CALL	NEWLINE			; FORMATTING
	PRTS("eZ80 HDMI:$")

	EZ80_EX_CRT_PROBE
	CP	VDP_SUPER
	JR	Z, EHDMI_INIT1		; CONTINUE IF HW PRESENT

	PRTS(":	NOT PRESENT$")
	OR	$FF			; SIGNAL FAILURE
	RET
;
EHDMI_INIT1:
	; vdp_init - load fonts

	LD	A, 9			; SET VDP to mode 0
	LD	B, 0			; VDU 22, 0
	LD	C, 22			; mode
	EZ80_FN
	LD	C, 0			; 0
	EZ80_FN


	; FIND IF THERE IS A USB KEYBOARD ATTACHED
	LD	C, 1
EHDMI_NEXT:
	PUSH	BC
	EZ80_EX_USB_GET_DEV_TYPE
	POP	BC
	CP	USB_IS_KEYBOARD
	JR	Z, EHDMI_USB_KYB_FOUND

	INC	C
	LD	A, C
	CP	MAX_NUMBER_OF_DEVICES+1
	JR	NZ, EHDMI_NEXT

; NO USB KEYBOARD FOUND
; SWITCH TO UART
	PRTS("	[UART INPUT]$")
	PRTS("	PRESENT$")

	LD	BC, EHDMI_FNTBL_UART	; BC := FUNCTION TABLE ADDRESS
	LD	DE, 0			; DE := NO INSTANCE DATA NEEDED
	CALL	CIO_ADDENT		; ADD ENTRY, A := UNIT ASSIGNED
	CALL	CIO_SETCRT

	XOR	A			; SIGNAL SUCCESS
	RET

EHDMI_USB_KYB_FOUND:
	PRTS("	[USB KYB INPUT]$")
	PRTS("	PRESENT$")

	EZ80_EX_USB_KYB_INIT

	LD	BC, EHDMI_FNTBL		; BC := FUNCTION TABLE ADDRESS
	LD	DE, 0			; DE := NO INSTANCE DATA NEEDED
	CALL	CIO_ADDENT		; ADD ENTRY, A := UNIT ASSIGNED
	CALL	CIO_SETCRT

	XOR	A			; SIGNAL SUCCESS
	RET

EHDMI_FNTBL:
	.DW	EHDMI_USB_IN
	.DW	EHDMI_OUT
	.DW	EHDMI_USB_IST
	.DW	EHDMI_OST
	.DW	EHDMI_INITDEV  
	.DW	EHDMI_QUERY
	.DW	EHDMI_DEVICE
#IF	(($ - EHDMI_FNTBL)!=(CIO_FNCNT*2))
	.ECHO	"*** INVALID EHDMI FUNCTION TABLE ***\n"
#ENDIF

EHDMI_FNTBL_UART:
	.DW	EZUART_IN
	.DW	EHDMI_OUT
	.DW	EZUART_IST
	.DW	EHDMI_OST
	.DW	EZUART_INITDEV  
	.DW	EZUART_QUERY
	.DW	EHDMI_DEVICE
#IF	(($ - EHDMI_FNTBL_UART)!=(CIO_FNCNT*2))
	.ECHO	"*** INVALID EHDMI FUNCTION TABLE ***\n"
#ENDIF

;
; ### Function 0x00 -- Character Input (CIOIN)
;
; Read and return a Character (E) from the USB keyboard stream.  If no
; character(s) are available in the input buffer, this function will wait
; indefinitely.  The returned Status (A) is a standard HBIOS result code.
;
; Outputs:
;  E: Character
;  A: Status (0-OK, else error)
;
EHDMI_USB_IN:
	EZ80_EX_USB_KYB_READ
	OR	A
	JR	NZ, EHDMI_USB_IN
	LD	E, L
	RET
;
; ### Function 0x00 -- Character Input (CIOIN)
;
; Read and return a Character (E) from the eZ80 UART.  If no character(s)
; are available in the input buffer, this function will wait indefinitely.
; The returned Status (A) is a standard HBIOS result code.
;
; Outputs:
;  E: Character
;  A: Status (0-OK, else error)
;
EHDMI_UART_IN:
	EZ80_UART_IN()			; CHAR RETURNED IN E
	RET
;
; ### Function 0x02 -- Character Input Status (CIOIST)
;
; Return the count of Characters Pending (A) from the USB input stream.
;
; The value returned in register A is used as both a Status (A) code and
; the return value. Negative values (bit 7 set) indicate a standard HBIOS
; result (error) code.  Otherwise, the return value represents the number
; of characters in the input buffer.
;
; Outputs:
;  A: Status / Characters Pending
;
EHDMI_USB_IST:
	EZ80_EX_USB_KYB_STATUS
	RET
;
; ### Function 0x02 -- Character Input Status (CIOIST)
;
; Return the count of Characters Pending (A) from the eZ80 UART input stream.
;
; The value returned in register A is used as both a Status (A) code and
; the return value. Negative values (bit 7 set) indicate a standard HBIOS
; result (error) code.  Otherwise, the return value represents the number
; of characters in the input buffer.
;
; Outputs:
;  A: Status / Characters Pending
;
EHDMI_UART_IST:
	EZ80_UART_IN_STAT()
	RET
;
; ### Function 0x03 -- Character Output Status (CIOOST)
;
; Return the status of the output FIFO.  0 means the output FIFO is full and
; no more characters can be sent. 1 means the output FIFO is not full and at
; least one character can be sent.  Negative values (bit 7 set) indicate a
; standard HBIOS result (error) code.
;
; Always returns OK for CRT
;
; Outputs
;   A: Status (0 -> Full, 1 -> OK to send, < 0 -> HBIOS error code)
;
EHDMI_OST:
	LD	A, 1
	RET
;
; ### Function 0x05 -- Character I/O Query (CIOQUERY)
;
; Returns the current Line Characteristics (DE).
;
; Line Characteristics not supported for eZ80 HDMI CRT.
;
; Outputs:
;  DE: Line Characteristics
;  A: Status (0-OK, else error)
;
EHDMI_QUERY:
	LD	DE, $FFFF
	LD	HL, $FFFF
	OR	$FF			; SIGNAL FAILURE
	RET
;
; ### Function 0x06 -- Character I/O Device (CIODEVICE)
;
; Returns device information.  The status (A) is a standard HBIOS result
; code.
;
; Outputs
;  A: Status (0 - OK)
;  C: Device Attribute (25 - parallel)
;  D: Device Type (CIODEV_EHDMI)
;  E: Physical Device Number
;  H: Device Mode (0)
;  L: Device I/O Base Address - Not Supported (0)
;
EHDMI_DEVICE
	LD	D, CIODEV_EHDMI		; TYPE IS TERMINAL
	LD	C, $FF
	LD	E, 1
	LD	HL, 0
	XOR	A			; SIGNAL SUCCESS
	RET
;
; ### Function 0x01 -- Character Output (CIOOUT)
;
; Write the Character (E) to the CRT/VDU driver.
;
; Inputs:
;  E: Character
;
; Outputs:
;  A: Status (0-OK, else error)
;
EHDMI_OUT
	LD	A, 9
	LD	B, 0
	LD	C, E
	EZ80_FN
;
; ### Function 0x04 -- Character I/O Initialization (CIOINIT)
;
; Not required for the eZ80 HDMI CRT interface
;
; Outputs:
;   A: Status (0-OK,)
;
EHDMI_INITDEV:
	XOR	A
	RET
