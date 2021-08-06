	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_buildLookupTable               ; -- Begin function buildLookupTable
	.p2align	2
_buildLookupTable:                      ; @buildLookupTable
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	sub	sp, sp, #496                    ; =496
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w27, -24
	.cfi_offset w28, -32
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	stur	x8, [x29, #-24]
	str	x0, [sp, #80]
	str	x1, [sp, #72]
	str	x2, [sp, #64]
	ldr	x8, [sp, #80]
	cbnz	x8, LBB0_2
; %bb.1:
	b	LBB0_5
LBB0_2:
	ldr	x8, [sp, #80]
	ldr	w9, [x8]
	mov	w10, #-1
	subs	w9, w9, w10
	b.eq	LBB0_4
; %bb.3:
	ldr	x8, [sp, #64]
	ldr	x9, [sp, #80]
	ldr	w10, [x9]
	subs	w10, w10, #931                  ; =931
	mov	w11, #200
	smaddl	x0, w10, w11, x8
	ldr	x1, [sp, #72]
	mov	x2, #-1
	bl	___strcpy_chk
LBB0_4:
	ldr	x1, [sp, #72]
	sub	x8, x29, #224                   ; =224
	mov	x0, x8
	mov	x9, #200
	mov	x2, x9
	str	x8, [sp, #56]                   ; 8-byte Folded Spill
	str	x9, [sp, #48]                   ; 8-byte Folded Spill
	bl	___strcpy_chk
	ldr	x8, [sp, #80]
	ldr	x8, [x8, #8]
	ldr	x9, [sp, #56]                   ; 8-byte Folded Reload
	mov	x0, x9
	adrp	x1, l_.str@PAGE
	add	x1, x1, l_.str@PAGEOFF
	ldr	x2, [sp, #48]                   ; 8-byte Folded Reload
	str	x8, [sp, #40]                   ; 8-byte Folded Spill
	bl	___strcat_chk
	ldr	x2, [sp, #64]
	ldr	x8, [sp, #40]                   ; 8-byte Folded Reload
	str	x0, [sp, #32]                   ; 8-byte Folded Spill
	mov	x0, x8
	ldr	x1, [sp, #32]                   ; 8-byte Folded Reload
	bl	_buildLookupTable
	ldr	x1, [sp, #72]
	add	x8, sp, #88                     ; =88
	mov	x0, x8
	ldr	x2, [sp, #48]                   ; 8-byte Folded Reload
	str	x8, [sp, #24]                   ; 8-byte Folded Spill
	bl	___strcpy_chk
	ldr	x8, [sp, #80]
	ldr	x8, [x8, #16]
	ldr	x9, [sp, #24]                   ; 8-byte Folded Reload
	mov	x0, x9
	adrp	x1, l_.str.1@PAGE
	add	x1, x1, l_.str.1@PAGEOFF
	ldr	x2, [sp, #48]                   ; 8-byte Folded Reload
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	bl	___strcat_chk
	ldr	x2, [sp, #64]
	ldr	x8, [sp, #16]                   ; 8-byte Folded Reload
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	mov	x0, x8
	ldr	x1, [sp, #8]                    ; 8-byte Folded Reload
	bl	_buildLookupTable
LBB0_5:
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	b.ne	LBB0_7
; %bb.6:
	add	sp, sp, #496                    ; =496
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
LBB0_7:
	bl	___stack_chk_fail
	.cfi_endproc
                                        ; -- End function
	.globl	_writeBitOut                    ; -- Begin function writeBitOut
	.p2align	2
_writeBitOut:                           ; @writeBitOut
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	x1, [sp]
	ldr	x0, [sp, #8]
	ldr	x3, [sp]
	mov	x8, #1
	mov	x1, x8
	mov	x2, x8
	bl	_fwrite
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32                     ; =32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_addNextChar                    ; -- Begin function addNextChar
	.p2align	2
_addNextChar:                           ; @addNextChar
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64                     ; =64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48                    ; =48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	x0, [x29, #-8]
	stur	x1, [x29, #-16]
	str	x2, [sp, #24]
	str	x3, [sp, #16]
	str	wzr, [sp, #12]
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x8, [sp, #16]
	ldrsb	w9, [x8]
	cbz	w9, LBB2_6
; %bb.2:                                ;   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1                      ; =1
	str	w8, [sp, #12]
	ldr	x9, [sp, #16]
	ldrsb	w8, [x9]
	subs	w8, w8, #48                     ; =48
	ldur	x9, [x29, #-8]
	ldrsb	w10, [x9]
	orr	w8, w10, w8
	strb	w8, [x9]
	ldur	x9, [x29, #-16]
	ldr	w8, [x9]
	add	w8, w8, #1                      ; =1
	str	w8, [x9]
	ldur	x9, [x29, #-16]
	ldrsw	x9, [x9]
	cmp	x9, #8                          ; =8
	b.ne	LBB2_4
; %bb.3:                                ;   in Loop: Header=BB2_1 Depth=1
	ldur	x0, [x29, #-8]
	ldr	x1, [sp, #24]
	bl	_writeBitOut
	ldur	x8, [x29, #-8]
	mov	w9, #0
	strb	w9, [x8]
	ldur	x8, [x29, #-16]
	str	wzr, [x8]
	b	LBB2_5
LBB2_4:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldur	x8, [x29, #-8]
	ldrsb	w9, [x8]
	lsl	w9, w9, #1
	ldur	x8, [x29, #-8]
	strb	w9, [x8]
LBB2_5:                                 ;   in Loop: Header=BB2_1 Depth=1
	ldr	x8, [sp, #16]
	add	x8, x8, #1                      ; =1
	str	x8, [sp, #16]
	b	LBB2_1
LBB2_6:
	ldr	w0, [sp, #12]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64                     ; =64
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3                               ; -- Begin function main
lCPI3_0:
	.quad	0x412e848000000000              ; double 1.0E+6
lCPI3_1:
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
	mov	w9, #40720
	adrp	x16, ___chkstk_darwin@GOTPAGE
	ldr	x16, [x16, ___chkstk_darwin@GOTPAGEOFF]
	blr	x16
	sub	sp, sp, #9, lsl #12             ; =36864
	sub	sp, sp, #3856                   ; =3856
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
	str	wzr, [sp, #108]
	str	w9, [sp, #28]                   ; 4-byte Folded Spill
	bl	_clock
	str	x0, [sp, #96]
	ldr	w0, [sp, #28]                   ; 4-byte Folded Reload
	adrp	x1, l_.str.2@PAGE
	add	x1, x1, l_.str.2@PAGEOFF
	bl	_setlocale
	adrp	x8, l_.str.3@PAGE
	add	x8, x8, l_.str.3@PAGEOFF
	mov	x0, x8
	adrp	x1, l_.str.4@PAGE
	add	x1, x1, l_.str.4@PAGEOFF
	bl	_fopen
	str	x0, [sp, #88]
	add	x0, sp, #9, lsl #12             ; =36864
	add	x0, x0, #3448                   ; =3448
	ldr	w9, [sp, #28]                   ; 4-byte Folded Reload
	mov	x1, x9
	mov	x2, #400
	bl	_memset
LBB3_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x0, [sp, #88]
	bl	_fgetwc
	str	w0, [sp, #84]
	mov	w8, #-1
	subs	w8, w0, w8
	b.eq	LBB3_3
; %bb.2:                                ;   in Loop: Header=BB3_1 Depth=1
	ldr	w8, [sp, #84]
	sxth	w8, w8
	subs	w8, w8, #931                    ; =931
	add	x9, sp, #9, lsl #12             ; =36864
	add	x9, x9, #3448                   ; =3448
	add	x9, x9, w8, sxtw #1
	ldrsh	w8, [x9]
	add	w8, w8, #1                      ; =1
	strh	w8, [x9]
	b	LBB3_1
LBB3_3:
	add	x0, sp, #9, lsl #12             ; =36864
	add	x0, x0, #3448                   ; =3448
	bl	_buildHuffmanTree
	str	x0, [sp, #72]
	adrp	x0, l_.str.5@PAGE
	add	x0, x0, l_.str.5@PAGEOFF
	adrp	x1, l_.str.6@PAGE
	add	x1, x1, l_.str.6@PAGEOFF
	bl	_fopen
	str	x0, [sp, #64]
	mov	w8, #0
	str	wzr, [sp, #60]
	ldr	x0, [sp, #64]
	mov	x1, #4
	mov	x2, x8
	bl	_fseek
	str	wzr, [sp, #56]
LBB3_4:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #56]
	cmp	w8, #200                        ; =200
	b.ge	LBB3_7
; %bb.5:                                ;   in Loop: Header=BB3_4 Depth=1
	ldrsw	x8, [sp, #56]
	add	x9, sp, #9, lsl #12             ; =36864
	add	x9, x9, #3448                   ; =3448
	add	x0, x9, x8, lsl #1
	ldr	x3, [sp, #64]
	mov	x1, #2
	mov	x2, #1
	bl	_fwrite
; %bb.6:                                ;   in Loop: Header=BB3_4 Depth=1
	ldr	w8, [sp, #56]
	add	w8, w8, #1                      ; =1
	str	w8, [sp, #56]
	b	LBB3_4
LBB3_7:
	add	x8, sp, #9, lsl #12             ; =36864
	add	x8, x8, #3248                   ; =3248
	mov	x0, x8
	mov	w9, #0
	mov	x1, x9
	mov	x2, #200
	str	x8, [sp, #16]                   ; 8-byte Folded Spill
	bl	_memset
	ldr	x0, [sp, #72]
	ldr	x1, [sp, #16]                   ; 8-byte Folded Reload
	add	x2, sp, #112                    ; =112
	bl	_buildLookupTable
	ldr	x0, [sp, #88]
	mov	x8, #0
	mov	x1, x8
	mov	w9, #0
	mov	x2, x9
	bl	_fseek
	mov	w9, #0
	strb	w9, [sp, #47]
	str	wzr, [sp, #40]
LBB3_8:                                 ; =>This Inner Loop Header: Depth=1
	ldr	x0, [sp, #88]
	bl	_fgetwc
	str	w0, [sp, #84]
	mov	w8, #-1
	subs	w8, w0, w8
	b.eq	LBB3_10
; %bb.9:                                ;   in Loop: Header=BB3_8 Depth=1
	ldr	w8, [sp, #84]
	subs	w8, w8, #931                    ; =931
	add	x9, sp, #112                    ; =112
	mov	w10, #200
	smaddl	x9, w8, w10, x9
	str	x9, [sp, #48]
	ldr	x2, [sp, #64]
	ldr	x3, [sp, #48]
	add	x0, sp, #47                     ; =47
	add	x1, sp, #40                     ; =40
	bl	_addNextChar
	ldr	w8, [sp, #60]
	add	w8, w8, w0
	str	w8, [sp, #60]
	b	LBB3_8
LBB3_10:
	ldr	w8, [sp, #40]
	cbz	w8, LBB3_12
; %bb.11:
	add	x0, sp, #47                     ; =47
	ldrsb	w8, [sp, #47]
	ldrsw	x9, [sp, #40]
	mov	x10, #8
	subs	x9, x10, x9
	mov	x10, #1
	subs	x9, x9, #1                      ; =1
                                        ; kill: def $w9 killed $w9 killed $x9
	lsl	w8, w8, w9
	strb	w8, [sp, #47]
	ldr	x3, [sp, #64]
	mov	x1, x10
	mov	x2, x10
	bl	_fwrite
LBB3_12:
	ldr	x0, [sp, #64]
	mov	x8, #0
	mov	x1, x8
	mov	w9, #0
	mov	x2, x9
	bl	_fseek
	ldr	x3, [sp, #64]
	add	x8, sp, #60                     ; =60
	mov	x0, x8
	mov	x1, #4
	mov	x2, #1
	bl	_fwrite
	ldr	x8, [sp, #64]
	mov	x0, x8
	bl	_fclose
	ldr	x8, [sp, #88]
	mov	x0, x8
	bl	_fclose
	bl	_clock
	str	x0, [sp, #32]
	ldr	x8, [sp, #32]
	ldr	x10, [sp, #96]
	subs	x8, x8, x10
	ucvtf	d0, x8
	adrp	x8, lCPI3_1@PAGE
	ldr	d1, [x8, lCPI3_1@PAGEOFF]
	fmul	d0, d0, d1
	adrp	x8, lCPI3_0@PAGE
	ldr	d1, [x8, lCPI3_0@PAGEOFF]
	fdiv	d0, d0, d1
	adrp	x0, l_.str.7@PAGE
	add	x0, x0, l_.str.7@PAGEOFF
	mov	x8, sp
	str	d0, [x8]
	bl	_printf
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	ldur	x10, [x29, #-24]
	subs	x8, x8, x10
	b.ne	LBB3_14
; %bb.13:
	mov	w8, #0
	mov	x0, x8
	add	sp, sp, #9, lsl #12             ; =36864
	add	sp, sp, #3856                   ; =3856
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
LBB3_14:
	bl	___stack_chk_fail
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"0"

l_.str.1:                               ; @.str.1
	.asciz	"1"

l_.str.2:                               ; @.str.2
	.space	1

l_.str.3:                               ; @.str.3
	.asciz	"output10m.txt"

l_.str.4:                               ; @.str.4
	.asciz	"r"

l_.str.5:                               ; @.str.5
	.asciz	"encoded.dat"

l_.str.6:                               ; @.str.6
	.asciz	"wb"

l_.str.7:                               ; @.str.7
	.asciz	"Time elapsed %.0f ms.\n"

.subsections_via_symbols
