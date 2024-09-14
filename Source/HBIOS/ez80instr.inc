;
;==================================================================================================
;   HELPER MACROS FOR TARGETING EZ80 CPU INSTRUCTIONS
;==================================================================================================

;
; EMIT PREFIX REQUIRED BY EZ80 TO ENSURE CORRECT 16 BIT IO OPERATION
;
#IF (CPUFAM == CPU_EZ80)
  ; RST.L $08
  #DEFINE EZ80_IO	.DB 	$49, $CF
  ; RST.L $10
  #DEFINE EZ80_FN 	.DB	$49, $D7

  #DEFINE EZ80_UTIL_VER_EXCH		XOR A \ LD B, 0 \ EZ80_FN
  #DEFINE EZ80_UTIL_SET_BUSTM 		XOR A \ LD B, 3 \ EZ80_FN
  #DEFINE EZ80_UTIL_SET_BUSFQ 		XOR A \ LD B, 4 \ EZ80_FN
  #DEFINE EZ80_UTIL_GET_CPU_FQ 		XOR A \ LD B, 5 \ EZ80_FN
  #DEFINE EZ80_UTIL_DEBUG 		XOR A \ LD B, 7 \ EZ80_FN

  #DEFINE EZ80_RTC_INIT 		LD A, 1 \ LD B, 0 \ EZ80_FN
  #DEFINE EZ80_RTC_GET_TIME 		LD A, 1	\ LD B, 1 \ EZ80_FN
  #DEFINE EZ80_RTC_SET_TIME 		LD A, 1	\ LD B, 2 \ EZ80_FN

  #DEFINE EZ80_TMR_GET_TICKS		LD A, 2 \ LD B,  0 \ EZ80_FN
  #DEFINE EZ80_TMR_GET_SECONDS		LD A, 2 \ LD B,  1 \ EZ80_FN
  #DEFINE EZ80_TMR_SET_TICKS		LD A, 2 \ LD B,  2 \ EZ80_FN
  #DEFINE EZ80_TMR_SET_SECONDS		LD A, 2 \ LD B,  3 \ EZ80_FN
  #DEFINE EZ80_TMR_GET_FREQTICK		LD A, 2 \ LD B,  4 \ EZ80_FN
  #DEFINE EZ80_TMR_SET_FREQTICK		LD A, 2 \ LD B,  5 \ EZ80_FN
  #DEFINE EZ80_TMR_THROTTLE_START	LD A, 2 \ LD B,  6 \ EZ80_FN
  #DEFINE EZ80_TMR_THROTTLE_WAIT	LD A, 2 \ LD B,  7 \ EZ80_FN
  #DEFINE EZ80_TMR_INT_DISABLE		LD A, 2 \ LD B,  8 \ EZ80_FN
  #DEFINE EZ80_TMR_INT_ENABLE		LD A, 2 \ LD B,  9 \ EZ80_FN
  #DEFINE EZ80_TMR_IS_TICK_ISR		LD A, 2 \ LD B, 10 \ EZ80_FN
  #DEFINE EZ80_TMR_DELAY		LD A, 2 \ LD B, 11 \ EZ80_FN

  #DEFINE EZ80_THROTTLE_START(p,store) \
  #DEFCONT \ PUSH AF
  #DEFCONT \ PUSH BC
  #DEFCONT \ PUSH HL
  #DEFCONT \ LD A, 2
  #DEFCONT \ LD BC, (6 * 256) + p
  #DEFCONT \ EZ80_FN
  #DEFCONT \ LD (store), HL
  #DEFCONT \ POP HL
  #DEFCONT \ POP BC
  #DEFCONT \ POP AF

  #DEFINE EZ80_THROTTLE_WAIT(p,store) \
  #DEFCONT \ PUSH AF
  #DEFCONT \ PUSH BC
  #DEFCONT \ PUSH HL
  #DEFCONT \ LD A, 2
  #DEFCONT \ LD BC, (7 * 256) + p
  #DEFCONT \ LD HL, (store)
  #DEFCONT \ EZ80_FN
  #DEFCONT \ LD (store), HL
  #DEFCONT \ POP HL
  #DEFCONT \ POP BC
  #DEFCONT \ POP AF

  #DEFINE EZ80_UART_IN		LD A, 3 \ LD B, 0 \ EZ80_FN
  #DEFINE EZ80_UART_OUT		LD A, 3 \ LD B, 1 \ EZ80_FN
  #DEFINE EZ80_UART_IN_STAT	LD A, 3 \ LD B, 2 \ EZ80_FN
  #DEFINE EZ80_UART_OUT_STAT	LD A, 3 \ LD B, 3 \ EZ80_FN
  #DEFINE EZ80_UART_CONFIG	LD A, 3 \ LD B, 4 \ EZ80_FN
  #DEFINE EZ80_UART_QUERY	LD A, 3 \ LD B, 5 \ EZ80_FN
  #DEFINE EZ80_UART_RESET	LD A, 3 \ LD B, 6 \ EZ80_FN

  #DEFINE RET.L		.DB	$49 \ RET

  #DEFINE IN0_A(p)	.DB	$ED,$38,p
  #DEFINE IN0_B(p)	.DB	$ED,$00,p
  #DEFINE IN0_C(p)	.DB	$ED,$08,p
  #DEFINE IN0_D(p)	.DB	$ED,$10,p
  #DEFINE IN0_E(p)	.DB	$ED,$18,p
  #DEFINE IN0_H(p)	.DB	$ED,$20,p
  #DEFINE IN0_L(p)	.DB	$ED,$28,p

  #DEFINE OUT0_A(p)	.DB	$ED,$39,p
  #DEFINE OUT0_B(p)	.DB	$ED,$01,p
  #DEFINE OUT0_C(p)	.DB	$ED,$09,p
  #DEFINE OUT0_D(p)	.DB	$ED,$11,p
  #DEFINE OUT0_E(p)	.DB	$ED,$19,p
  #DEFINE OUT0_H(p)	.DB	$ED,$21,p
  #DEFINE OUT0_L(p)	.DB	$ED,$29,p

  #DEFINE LDHLMM.LIL(Mmn)	\
  #defcont \	.DB	$5B
  #defcont \	LD	HL, Mmn
  #defcont \	.DB	(Mmn >> 16) & $FF

  #DEFINE LDBCMM.LIL(Mmn)	\
  #defcont \	.DB	$5B
  #defcont \	LD	BC, Mmn
  #defcont \	.DB	(Mmn >> 16) & $FF

  #DEFINE SBCHLBC.LIL \
  #defcont \	.DB	$49
  #defcont \	SBC	HL, BC

IO_SEGMENT	.EQU		$FF		; THE UPPER 8-BIT ADDRESS FOR I/O

  #DEFINE OUT_NN_A(addr) \
  #DEFCONT \ PUSH	BC
  #DEFCONT \ LD	BC, IO_SEGMENT << 8 | addr
  #DEFCONT \ OUT	(C), A
  #DEFCONT \ POP	BC

  #DEFINE IN_A_NN(addr) \
  #DEFCONT \ LD A, IO_SEGMENT
  #DEFCONT \ IN A, (addr)

#define EZ80_CPY_EHL_TO_UHL 	CALL _EZ80_CPY_EHL_TO_UHL
#define EZ80_CPY_UHL_TO_EHL	CALL _EZ80_CPY_UHL_TO_EHL

#ELSE
  #DEFINE EZ80_IO

  #DEFINE EZ80_THROTTLE_START(p,store)
  #DEFINE EZ80_THROTTLE_WAIT(p,store)

IO_SEGMENT	.EQU		$FF		; THE UPPER 8-BIT ADDRESS FOR I/O

  #DEFINE OUT_NN_A(addr) OUT (addr), A
  #DEFINE IN_A_NN(addr)  IN A, (addr)

#ENDIF