;
; Generated from source-doc/base-drv/enumerate_storage.c.asm -- not to be modify directly
;
; 
;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.4.0 #14648 (Linux)
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
;source-doc/base-drv/enumerate_storage.c:5: void parse_endpoints(device_config *const storage_dev, const endpoint_descriptor const *pEndpoint) {
; ---------------------------------
; Function parse_endpoints
; ---------------------------------
_parse_endpoints:
	push	ix
	ld	ix,0
	add	ix,sp
	push	af
;source-doc/base-drv/enumerate_storage.c:7: if (!(pEndpoint->bmAttributes & 0x02))
	ld	l,(ix+6)
	ld	h,(ix+7)
	ld	c,l
	ld	b,h
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(ix-2),a
	bit	1,a
;source-doc/base-drv/enumerate_storage.c:8: return;
	jr	Z,l_parse_endpoints_00108
;source-doc/base-drv/enumerate_storage.c:10: const uint8_t         x   = calc_max_packet_sizex(pEndpoint->wMaxPacketSize);
	ld	hl,4
	add	hl,bc
	ld	a, (hl)
	ld	(ix-1),a
;source-doc/base-drv/enumerate_storage.c:11: endpoint_param *const eps = storage_dev->endpoints;
	ld	e,(ix+4)
	ld	d,(ix+5)
	inc	de
	inc	de
	inc	de
;source-doc/base-drv/enumerate_storage.c:15: if (!(pEndpoint->bEndpointAddress & 0x80))
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c,a
	and	0x80
	ld	b,0x00
;source-doc/base-drv/enumerate_storage.c:14: if (pEndpoint->bmAttributes & 0x01) { // 3 -> Interrupt
	bit	0,(ix-2)
	jr	Z,l_parse_endpoints_00106
;source-doc/base-drv/enumerate_storage.c:15: if (!(pEndpoint->bEndpointAddress & 0x80))
	or	b
;source-doc/base-drv/enumerate_storage.c:16: return;
	jr	Z,l_parse_endpoints_00108
;source-doc/base-drv/enumerate_storage.c:18: ep = &eps[ENDPOINT_INTERRUPT_IN];
	ld	hl,0x0006
	add	hl, de
	ex	de, hl
	jr	l_parse_endpoints_00107
l_parse_endpoints_00106:
;source-doc/base-drv/enumerate_storage.c:21: ep = (pEndpoint->bEndpointAddress & 0x80) ? &eps[ENDPOINT_BULK_IN] : &eps[ENDPOINT_BULK_OUT];
	or	b
	jr	Z,l_parse_endpoints_00110
	inc	de
	inc	de
	inc	de
l_parse_endpoints_00110:
l_parse_endpoints_00107:
;source-doc/base-drv/enumerate_storage.c:24: ep->number           = pEndpoint->bEndpointAddress & 0x07;
	ld	l, e
	ld	h, d
	ld	a, c
	and	0x07
	rlca
	and	0x0e
	ld	c, a
	ld	a, (hl)
	and	0xf1
	or	c
	ld	(hl), a
;source-doc/base-drv/enumerate_storage.c:25: ep->toggle           = 0;
	ld	l, e
	ld	h, d
	res	0, (hl)
;source-doc/base-drv/enumerate_storage.c:26: ep->max_packet_sizex = x;
	inc	de
	ld	a,(ix-1)
	ld	b,0x00
	ld	(de), a
	inc	de
	ld	a, b
	and	0x03
	ld	l,a
	ld	a, (de)
	and	0xfc
	or	l
	ld	(de), a
l_parse_endpoints_00108:
;source-doc/base-drv/enumerate_storage.c:27: }
	ld	sp, ix
	pop	ix
	ret