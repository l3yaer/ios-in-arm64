    .section __TEXT,__text,regular,pure_instructions
    .global view_Setup
    .align 4
view_Setup:
    stp x29, x30, [sp, -0x10]!
    mov x29, sp

    adrp x0, view_ParentClassName@PAGE
    add x0, x0, view_ParentClassName@PAGEOFF
    bl _objc_getClass

    adrp x1, view_ClassName@PAGE
    add x1, x1, view_ClassName@PAGEOFF
    mov x2, 0x0
    bl _objc_allocateClassPair

    adrp x1, view_Class@PAGE
    add x1, x1, view_Class@PAGEOFF
    str x0, [x1]
    mov x4, x0

    adrp x0, view_MethodName@PAGE
    add x0, x0, view_MethodName@PAGEOFF
    bl _sel_getUid

    mov x1, x0
    mov x0, x4
    adrp x2, view_DrawRect@PAGE
    add x2, x2, view_DrawRect@PAGEOFF
    adrp x3, view_MethodEncoding@PAGE
    add x3, x3, view_MethodEncoding@PAGEOFF
    bl _class_addMethod

    mov x0, x4
    bl _objc_allocateClassPair

    ldp x29, x30, [sp], 0x10
    ret

view_DrawRect:
    sub sp, sp, 0x20
    stp x29, x30, [sp, 0x10]
    sub x29, sp, 0x10


    bl _UIGraphicsGetCurrentContext
    mov x4, x0

    adrp x1, view_FillColor@PAGE
    add x1, x1, view_FillColor@PAGEOFF
    bl _CGContextSetFillColor

    mov x0, x4
    adrp x9, view_FillRect@PAGE
    add x9, x9, view_FillRect@PAGEOFF
    ldr d0, [x9]
    ldr d1, [x9, 0x4]
    ldr d2, [x9, 0x8]
    ldr d3, [x9, 0xc]
    str x9, [sp]
    bl _CGContextFillRect

    mov x0, x4
    adrp x1, view_FontName@PAGE
    add x1, x1, view_FontName@PAGEOFF
    fmov d0, #12.0
    mov x2, 0x1
    bl _CGContextSelectFont

    mov x0, x4
    adrp x1, view_FillColor@PAGE
    add x1, x1, view_FillColor@PAGEOFF
    bl _CGContextSetFillColor

    mov x0, x4
    fmov d0, #1.0
    fmov d1, #0.0
    fmov d2, #0.0
    fmov d3, #-1.0
    fmov d4, #0.0
    fmov d5, #0.0
    bl _CGContextSetTextMatrix

    adrp x0, view_DrawStringPosition@PAGE
    add x0, x0, view_DrawStringPosition@PAGEOFF
    ldr d0, [x0]
    ldr d1, [x0, 0x4]
    mov x0, x4
    bl _CGContextSetTextPosition

    mov x0, x4
    adrp x1, view_drawString@PAGE
    add x1, x1, view_drawString@PAGEOFF
    mov x2, 0x10
    bl _CGContextShowText

    ldp x29, x30, [sp], 0x10
    add sp, sp, 0x20
    ret

    .section __TEXT,__cstring
view_ParentClassName:
    .asciz "UIView"

view_ClassName:
    .asciz "View"

view_MethodName:
    .asciz "drawRect:"

view_MethodEncoding:
    .asciz "v@:{CGRect={CGPoint=ff}CGSize=ff}"

view_drawString:
    .asciz "Hello, ASM!"


    .section __DATA,regular
    .align 4

view_Class:
    .long 0

view_FillRect:
    .float 0, 0, 1000, 1000

view_FillColor:
    .float 1, 0, 1, 1

view_FontName:
    .asciz "Helvetica"

view_DrawColor:
    .float 0, 1, 1, 1

view_DrawStringPosition:
    .float 100, 100

view_DrawStringLength:
    .int 16
