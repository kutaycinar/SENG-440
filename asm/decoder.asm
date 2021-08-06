	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_getNextBit                     ; -- Begin function getNextBit
	.p2align	2
_getNextBit:                            ; @getNextBit
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48                    ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-16]
	str	x1, [sp, #24]
	str	x2, [sp, #16]
	str	x3, [sp, #8]
	ldr	x8, [sp, #24]
	ldr	w9, [x8]
	cbnz	w9, LBB0_4
; %bb.1:
	ldur	x0, [x29, #-16]
	ldr	x3, [sp, #16]
	mov	x8, #1
	mov	x1, x8
	mov	x2, x8
	bl	_fread
	cmp	x0, #1                          ; =1
	b.hs	LBB0_3
; %bb.2:
	mov	w8, #-1
	stur	w8, [x29, #-4]
	b	LBB0_5
LBB0_3:
	ldr	x8, [sp, #24]
	mov	w9, #8
	str	w9, [x8]
LBB0_4:
	ldur	x8, [x29, #-16]
	ldrsb	w9, [x8]
	and	w9, w9, #0x80
	asr	w9, w9, #7
	str	w9, [sp, #4]
	ldr	x8, [sp, #24]
	ldr	w9, [x8]
	subs	w9, w9, #1                      ; =1
	str	w9, [x8]
	ldr	x8, [sp, #8]
	ldr	w9, [x8]
	subs	w9, w9, #1                      ; =1
	str	w9, [x8]
	ldur	x8, [x29, #-16]
	ldrsb	w9, [x8]
	lsl	w9, w9, #1
	ldur	x8, [x29, #-16]
	strb	w9, [x8]
	ldr	w9, [sp, #4]
	stur	w9, [x29, #-4]
LBB0_5:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function main
lCPI1_0:
	.quad	0x412e848000000000              ; double 1.0E+6
lCPI1_1:
	.quad	0x408f400000000000              ; double 1000
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	sub	sp, sp, #528                    ; =528
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
	mov	w9, #0
	str	wzr, [sp, #116]
	str	w9, [sp, #28]                   ; 4-byte Folded Spill
	bl	_clock
	str	x0, [sp, #104]
	ldr	w0, [sp, #28]                   ; 4-byte Folded Reload
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	bl	_setlocale
	adrp	x8, l_.str.1@PAGE
	add	x8, x8, l_.str.1@PAGEOFF
	mov	x0, x8
	adrp	x1, l_.str.2@PAGE
	add	x1, x1, l_.str.2@PAGEOFF
	bl	_fopen
	str	x0, [sp, #96]
	ldr	x3, [sp, #96]
	add	x0, sp, #92                     ; =92
	mov	x1, #4
	mov	x2, #1
	bl	_fread
	add	x8, sp, #120                    ; =120
	mov	x0, x8
	ldr	w9, [sp, #28]                   ; 4-byte Folded Reload
	mov	x1, x9
	mov	x2, #400
	bl	_memset
	str	wzr, [sp, #84]
LBB1_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #84]
	cmp	w8, #200                        ; =200
	b.ge	LBB1_4
; %bb.2:                                ;   in Loop: Header=BB1_1 Depth=1
	ldr	x3, [sp, #96]
	add	x0, sp, #90                     ; =90
	mov	x1, #2
	mov	x2, #1
	bl	_fread
	ldrh	w8, [sp, #90]
	ldrsw	x9, [sp, #84]
	add	x10, sp, #120                   ; =120
	add	x9, x10, x9, lsl #1
	strh	w8, [x9]
; %bb.3:                                ;   in Loop: Header=BB1_1 Depth=1
	ldr	w8, [sp, #84]
	add	w8, w8, #1                      ; =1
	str	w8, [sp, #84]
	b	LBB1_1
LBB1_4:
	add	x0, sp, #120                    ; =120
	bl	_buildHuffmanTree
	str	x0, [sp, #72]
	ldr	x0, [sp, #72]
	bl	_printHuffmanTree
	adrp	x0, l_.str.3@PAGE
	add	x0, x0, l_.str.3@PAGEOFF
	adrp	x1, l_.str.4@PAGE
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fopen
	str	x0, [sp, #64]
	mov	w8, #0
	strb	w8, [sp, #63]
	str	wzr, [sp, #56]
	ldr	x9, [sp, #72]
	str	x9, [sp, #40]
LBB1_5:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x2, [sp, #96]
	add	x0, sp, #63                     ; =63
	add	x1, sp, #56                     ; =56
	add	x3, sp, #92                     ; =92
	bl	_getNextBit
	str	w0, [sp, #52]
	ldr	w8, [sp, #52]
	cbnz	w8, LBB1_7
; %bb.6:                                ;   in Loop: Header=BB1_5 Depth=1
	ldr	x8, [sp, #40]
	ldr	x8, [x8, #8]
	str	x8, [sp, #40]
LBB1_7:                                 ;   in Loop: Header=BB1_5 Depth=1
	ldr	w8, [sp, #52]
	cmp	w8, #1                          ; =1
	b.ne	LBB1_9
; %bb.8:                                ;   in Loop: Header=BB1_5 Depth=1
	ldr	x8, [sp, #40]
	ldr	x8, [x8, #16]
	str	x8, [sp, #40]
LBB1_9:                                 ;   in Loop: Header=BB1_5 Depth=1
	ldr	x8, [sp, #40]
	ldr	w9, [x8]
	mov	w10, #-1
	subs	w9, w9, w10
	b.eq	LBB1_11
; %bb.10:                               ;   in Loop: Header=BB1_5 Depth=1
	ldr	x0, [sp, #64]
	ldr	x8, [sp, #40]
	ldr	w9, [x8]
                                        ; implicit-def: $x1
	mov	x1, x9
	adrp	x8, l_.str.5@PAGE
	add	x8, x8, l_.str.5@PAGEOFF
	str	x1, [sp, #16]                   ; 8-byte Folded Spill
	mov	x1, x8
	mov	x8, sp
	ldr	x10, [sp, #16]                  ; 8-byte Folded Reload
	str	x10, [x8]
	bl	_fwprintf
	ldr	x8, [sp, #72]
	str	x8, [sp, #40]
LBB1_11:                                ;   in Loop: Header=BB1_5 Depth=1
; %bb.12:                               ;   in Loop: Header=BB1_5 Depth=1
	ldr	w8, [sp, #52]
	mov	w9, #-1
	mov	w10, #0
	subs	w8, w8, w9
	str	w10, [sp, #12]                  ; 4-byte Folded Spill
	b.eq	LBB1_14
; %bb.13:                               ;   in Loop: Header=BB1_5 Depth=1
	ldr	w8, [sp, #92]
	cmp	w8, #0                          ; =0
	cset	w8, gt
	str	w8, [sp, #12]                   ; 4-byte Folded Spill
LBB1_14:                                ;   in Loop: Header=BB1_5 Depth=1
	ldr	w8, [sp, #12]                   ; 4-byte Folded Reload
	tbnz	w8, #0, LBB1_5
; %bb.15:
	ldr	x0, [sp, #96]
	bl	_fclose
	ldr	x8, [sp, #64]
	mov	x0, x8
	bl	_fclose
	bl	_clock
	str	x0, [sp, #32]
	ldr	x8, [sp, #32]
	ldr	x9, [sp, #104]
	subs	x8, x8, x9
	ucvtf	d0, x8
	adrp	x8, lCPI1_1@PAGE
	ldr	d1, [x8, lCPI1_1@PAGEOFF]
	fmul	d0, d0, d1
	adrp	x8, lCPI1_0@PAGE
	ldr	d1, [x8, lCPI1_0@PAGEOFF]
	fdiv	d0, d0, d1
	adrp	x0, l_.str.6@PAGE
	add	x0, x0, l_.str.6@PAGEOFF
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	b.ne	LBB1_17
; %bb.16:
	mov	w8, #0
	mov	x0, x8
	add	sp, sp, #528                    ; =528
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
LBB1_17:
	bl	___stack_chk_fail
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.space	1

l_.str.1:                               ; @.str.1
	.asciz	"encoded.dat"

l_.str.2:                               ; @.str.2
	.asciz	"rb"

l_.str.3:                               ; @.str.3
	.asciz	"decoded.txt"

l_.str.4:                               ; @.str.4
	.asciz	"w"

	.section	__TEXT,__const
	.p2align	2                               ; @.str.5
l_.str.5:
	.long	37                              ; 0x25
	.long	67                              ; 0x43
	.long	0                               ; 0x0

	.section	__TEXT,__cstring,cstring_literals
l_.str.6:                               ; @.str.6
	.asciz	"Time elapsed %.0f ms.\n"

.subsections_via_symbols
