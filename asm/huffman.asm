	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 11, 3
	.globl	_newNode                        ; -- Begin function newNode
	.p2align	2
_newNode:                               ; @newNode
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	w0, [x29, #-4]
	str	w1, [sp, #8]
	mov	x0, #24
	bl	_malloc
	str	x0, [sp]
	ldur	w8, [x29, #-4]
	ldr	x9, [sp]
	str	w8, [x9]
	ldr	w8, [sp, #8]
	ldr	x9, [sp]
	str	w8, [x9, #4]
	ldr	x9, [sp]
	str	xzr, [x9, #8]
	ldr	x9, [sp]
	str	xzr, [x9, #16]
	ldr	x0, [sp]
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32                     ; =32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_printCurrentLevel              ; -- Begin function printCurrentLevel
	.p2align	2
_printCurrentLevel:                     ; @printCurrentLevel
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	str	w1, [sp, #4]
	ldr	x8, [sp, #8]
	cbnz	x8, LBB1_2
; %bb.1:
	b	LBB1_5
LBB1_2:
	ldr	w8, [sp, #4]
	cmp	w8, #1                          ; =1
	b.le	LBB1_4
; %bb.3:
	ldr	x8, [sp, #8]
	ldr	x0, [x8, #8]
	ldr	w9, [sp, #4]
	subs	w1, w9, #1                      ; =1
	bl	_printCurrentLevel
	ldr	x8, [sp, #8]
	ldr	x0, [x8, #16]
	ldr	w9, [sp, #4]
	subs	w1, w9, #1                      ; =1
	bl	_printCurrentLevel
LBB1_4:
LBB1_5:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32                     ; =32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_printHuffmanTree               ; -- Begin function printHuffmanTree
	.p2align	2
_printHuffmanTree:                      ; @printHuffmanTree
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32                     ; =32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #8]
	ldr	x0, [sp, #8]
	bl	_height
	str	w0, [sp, #4]
	mov	w8, #1
	str	w8, [sp]
LBB2_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp]
	ldr	w9, [sp, #4]
	subs	w8, w8, w9
	b.gt	LBB2_4
; %bb.2:                                ;   in Loop: Header=BB2_1 Depth=1
	ldr	x0, [sp, #8]
	ldr	w1, [sp]
	bl	_printCurrentLevel
; %bb.3:                                ;   in Loop: Header=BB2_1 Depth=1
	ldr	w8, [sp]
	add	w8, w8, #1                      ; =1
	str	w8, [sp]
	b	LBB2_1
LBB2_4:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32                     ; =32
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_height                         ; -- Begin function height
	.p2align	2
_height:                                ; @height
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48                     ; =48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32                    ; =32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	str	x0, [sp, #16]
	ldr	x8, [sp, #16]
	cbnz	x8, LBB3_2
; %bb.1:
	stur	wzr, [x29, #-4]
	b	LBB3_5
LBB3_2:
	ldr	x8, [sp, #16]
	ldr	x0, [x8, #8]
	bl	_height
	str	w0, [sp, #12]
	ldr	x8, [sp, #16]
	ldr	x0, [x8, #16]
	bl	_height
	str	w0, [sp, #8]
	ldr	w9, [sp, #12]
	ldr	w10, [sp, #8]
	subs	w9, w9, w10
	b.le	LBB3_4
; %bb.3:
	ldr	w8, [sp, #12]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-4]
	b	LBB3_5
LBB3_4:
	ldr	w8, [sp, #8]
	add	w8, w8, #1                      ; =1
	stur	w8, [x29, #-4]
LBB3_5:
	ldur	w0, [x29, #-4]
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48                     ; =48
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_buildHuffmanTree               ; -- Begin function buildHuffmanTree
	.p2align	2
_buildHuffmanTree:                      ; @buildHuffmanTree
	.cfi_startproc
; %bb.0:
	stp	x28, x27, [sp, #-32]!           ; 16-byte Folded Spill
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16                    ; =16
	sub	sp, sp, #1696                   ; =1696
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
	add	x0, sp, #88                     ; =88
	mov	w9, #0
	mov	x1, x9
	mov	x2, #1600
	bl	_memset
	str	wzr, [sp, #76]
LBB4_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #76]
	cmp	w8, #200                        ; =200
	b.ge	LBB4_4
; %bb.2:                                ;   in Loop: Header=BB4_1 Depth=1
	ldr	w8, [sp, #76]
	add	w0, w8, #931                    ; =931
	ldr	x9, [sp, #80]
	ldrsw	x10, [sp, #76]
	ldrsh	w1, [x9, x10, lsl #1]
	bl	_newNode
	str	x0, [sp, #64]
	ldr	x9, [sp, #64]
	ldrsw	x10, [sp, #76]
	add	x11, sp, #88                    ; =88
	add	x10, x11, x10, lsl #3
	str	x9, [x10]
; %bb.3:                                ;   in Loop: Header=BB4_1 Depth=1
	ldr	w8, [sp, #76]
	add	w8, w8, #1                      ; =1
	str	w8, [sp, #76]
	b	LBB4_1
LBB4_4:
	mov	w8, #200
	str	w8, [sp, #60]
LBB4_5:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB4_7 Depth 2
	ldr	w8, [sp, #60]
	cmp	w8, #1                          ; =1
	b.le	LBB4_18
; %bb.6:                                ;   in Loop: Header=BB4_5 Depth=1
	str	wzr, [sp, #56]
	str	wzr, [sp, #52]
	mov	w8, #2147483647
	str	w8, [sp, #48]
	str	w8, [sp, #44]
	str	wzr, [sp, #40]
LBB4_7:                                 ;   Parent Loop BB4_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w8, [sp, #40]
	cmp	w8, #200                        ; =200
	b.ge	LBB4_17
; %bb.8:                                ;   in Loop: Header=BB4_7 Depth=2
	ldrsw	x8, [sp, #40]
	add	x9, sp, #88                     ; =88
	ldr	x8, [x9, x8, lsl #3]
	ldr	w10, [x8, #4]
	str	w10, [sp, #36]
	ldr	w10, [sp, #36]
	mov	w11, #-1
	subs	w10, w10, w11
	b.ne	LBB4_10
; %bb.9:                                ;   in Loop: Header=BB4_7 Depth=2
	b	LBB4_16
LBB4_10:                                ;   in Loop: Header=BB4_7 Depth=2
	ldr	w8, [sp, #36]
	ldr	w9, [sp, #48]
	subs	w8, w8, w9
	b.ge	LBB4_12
; %bb.11:                               ;   in Loop: Header=BB4_7 Depth=2
	ldr	w8, [sp, #52]
	str	w8, [sp, #56]
	ldr	w8, [sp, #40]
	str	w8, [sp, #52]
	ldr	w8, [sp, #48]
	str	w8, [sp, #44]
	ldr	w8, [sp, #36]
	str	w8, [sp, #48]
	b	LBB4_15
LBB4_12:                                ;   in Loop: Header=BB4_7 Depth=2
	ldr	w8, [sp, #36]
	ldr	w9, [sp, #44]
	subs	w8, w8, w9
	b.ge	LBB4_14
; %bb.13:                               ;   in Loop: Header=BB4_7 Depth=2
	ldr	w8, [sp, #36]
	str	w8, [sp, #44]
	ldr	w8, [sp, #52]
	str	w8, [sp, #56]
	ldr	w8, [sp, #40]
	str	w8, [sp, #52]
LBB4_14:                                ;   in Loop: Header=BB4_7 Depth=2
LBB4_15:                                ;   in Loop: Header=BB4_7 Depth=2
LBB4_16:                                ;   in Loop: Header=BB4_7 Depth=2
	ldr	w8, [sp, #40]
	add	w8, w8, #1                      ; =1
	str	w8, [sp, #40]
	b	LBB4_7
LBB4_17:                                ;   in Loop: Header=BB4_5 Depth=1
	ldr	w8, [sp, #48]
	ldr	w9, [sp, #44]
	add	w1, w8, w9
	mov	w8, #-1
	mov	x0, x8
	str	w8, [sp, #20]                   ; 4-byte Folded Spill
	bl	_newNode
	str	x0, [sp, #24]
	ldrsw	x10, [sp, #56]
	add	x11, sp, #88                    ; =88
	ldr	x10, [x11, x10, lsl #3]
	ldr	x12, [sp, #24]
	str	x10, [x12, #16]
	ldrsw	x10, [sp, #52]
	ldr	x10, [x11, x10, lsl #3]
	ldr	x12, [sp, #24]
	str	x10, [x12, #8]
	ldr	x10, [sp, #24]
	ldrsw	x12, [sp, #56]
	mov	x13, x11
	add	x12, x13, x12, lsl #3
	str	x10, [x12]
	ldrsw	x10, [sp, #52]
	ldr	x10, [x11, x10, lsl #3]
	ldr	w8, [sp, #20]                   ; 4-byte Folded Reload
	str	w8, [x10, #4]
	ldr	w9, [sp, #60]
	subs	w9, w9, #1                      ; =1
	str	w9, [sp, #60]
	b	LBB4_5
LBB4_18:
	ldr	x0, [sp, #88]
	adrp	x8, ___stack_chk_guard@GOTPAGE
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
	ldr	x8, [x8]
	ldur	x9, [x29, #-24]
	subs	x8, x8, x9
	str	x0, [sp, #8]                    ; 8-byte Folded Spill
	b.ne	LBB4_20
; %bb.19:
	ldr	x0, [sp, #8]                    ; 8-byte Folded Reload
	add	sp, sp, #1696                   ; =1696
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x28, x27, [sp], #32             ; 16-byte Folded Reload
	ret
LBB4_20:
	bl	___stack_chk_fail
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
