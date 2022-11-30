    .section __TEXT,__text,regular,pure_instructions
    .global view_Setup
    .align 4
view_Setup:
    sub sp, sp, 0x20
    stp x29, x30, [sp, 0x10]
    add x29, sp, 0x10

    adrp x0, view_ParentClassName@PAGE
    add x0, x0, view_ParentClassName@PAGEOFF
    bl _objc_getClass

    adrp x1, view_ClassName@PAGE
    add x1, x1, view_ClassName@PAGEOFF
    mov x2, 0x0
    bl _objc_allocateClassPair
    str x0, [sp]

    adrp x0, view_MethodName@PAGE
    add x0, x0, view_MethodName@PAGEOFF
    bl _sel_getUid

    mov x1, x0
    ldr x0, [sp]
    adrp x2, view_DrawRect@PAGE
    add x2, x2, view_DrawRect@PAGEOFF
    adrp x3, view_MethodEncoding@PAGE
    add x3, x3, view_MethodEncoding@PAGEOFF
    bl _class_addMethod

    ldr x0, [sp]
    bl _objc_registerClassPair

    ldp x29, x30, [sp, 0x10]
    add sp, sp, 0x20
    ret

view_DrawRect:
    sub sp, sp, 0x50
    stp x29, x30, [sp, 0x40]
    sub x29, sp, 0x40

    str d0, [sp, 0x20]
    str d1, [sp, 0x28]
    str d2, [sp, 0x30]
    str d3, [sp, 0x38]

    bl _UIGraphicsGetCurrentContext
    str x0, [sp]

    adrp x1, view_FillColor@PAGE
    add x1, x1, view_FillColor@PAGEOFF
    bl _CGContextSetFillColor

    ldr x0, [sp]
    ldr d0, [sp, 0x20]
    ldr d1, [sp, 0x28]
    ldr d2, [sp, 0x30]
    ldr d3, [sp, 0x38]
    bl _CGContextFillRect

    ldp x29, x30, [sp, 0x40]
    add sp, sp, 0x50
    ret

    .section __TEXT,__cstring
view_ParentClassName:
    .asciz "UIView"

view_ClassName:
    .asciz "View"

view_MethodName:
    .asciz "drawRect:"

view_MethodEncoding:
    .asciz "v@:"

view_drawString:
    .asciz "Hello, ASM!"


    .section __TEXT,__const
    .align 4

view_FillColor:
    .double 1.0, 1.0, 1.0, 1.0
