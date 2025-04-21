;
; Generated from source-doc/base-drv/hbios-driver-storage.c.asm -- not to be modify directly
;
; 
;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15248 (Linux)
;--------------------------------------------------------
; Processed by Z88DK
;--------------------------------------------------------
	

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
;--------------------------------------------------------
; Externals used
;--------------------------------------------------------
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
_CH376_DATA_PORT	.EQU	0xff88
_CH376_COMMAND_PORT	.EQU	0xff89
_USB_MODULE_LEDS	.EQU	0xff8a
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	
#IF 0
	
; .area _INITIALIZED removed by z88dk
	
_hbios_usb_storage_devices:
	DEFS 12
	
#ENDIF
	
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
;--------------------------------------------------------
; Home
;--------------------------------------------------------
;--------------------------------------------------------
; code
;--------------------------------------------------------
;source-doc/base-drv/hbios-driver-storage.c:5: uint8_t find_storage_dev(void) {
; ---------------------------------
; Function find_storage_dev
; ---------------------------------
_find_storage_dev:
;source-doc/base-drv/hbios-driver-storage.c:6: for (uint8_t i = 0; i < MAX_NUMBER_OF_DEVICES; i++)
	ld	c,0x00
	ld	de,_hbios_usb_storage_devices+0
	ld	b,c
l_find_storage_dev_00105:
	ld	a, b
	sub	0x06
	jr	NC,l_find_storage_dev_00103
;source-doc/base-drv/hbios-driver-storage.c:7: if (hbios_usb_storage_devices[i].drive_index == 0)
	ld	l, b
	ld	h,0x00
	add	hl, hl
	add	hl, de
	ld	a, (hl)
	or	a
	jr	NZ,l_find_storage_dev_00106
;source-doc/base-drv/hbios-driver-storage.c:8: return i;
	ld	l, c
	jr	l_find_storage_dev_00107
l_find_storage_dev_00106:
;source-doc/base-drv/hbios-driver-storage.c:6: for (uint8_t i = 0; i < MAX_NUMBER_OF_DEVICES; i++)
	inc	b
	ld	c, b
	jr	l_find_storage_dev_00105
l_find_storage_dev_00103:
;source-doc/base-drv/hbios-driver-storage.c:10: return -1;
	ld	l,0xff
l_find_storage_dev_00107:
;source-doc/base-drv/hbios-driver-storage.c:11: }
	ret
_hbios_usb_storage_devices:
	DEFB +0x00
	DEFB +0x00
	DEFB 0x00
	DEFB 0x00
	DEFB 0x00
	DEFB 0x00
	DEFB 0x00
	DEFB 0x00
	DEFB 0x00
	DEFB 0x00
	DEFB 0x00
	DEFB 0x00
