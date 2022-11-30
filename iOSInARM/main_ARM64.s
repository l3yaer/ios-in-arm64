    .section __TEXT,__text,regular,pure_instructions
    .global _main
    .align 4
_main:
    sub sp, sp, 0x30
    stp x29, x30, [sp, 0x20]
    add x29, sp, 0x20
    mov w8, 0x0
    str w8, [sp, 0x10]
    stur wzr, [x29, -0x4]
    stur w0, [x29, -0x8]
    str x1, [sp, -0x10]

    bl _objc_autoreleasePoolPush
    str x0, [sp, 0x8]

    bl appDelegate_Setup

    bl view_Setup

    mov x0, 0x0
    adrp x1, s_delegateClassNameCStr@PAGE
    add x1, x1, s_delegateClassNameCStr@PAGEOFF
    mov x2, 0x600
    bl _CFStringCreateWithCString

    mov x3, x0
    mov x0, 0x0
    mov x1, 0x0
    mov x2, 0x0
    bl _UIApplicationMain

    ldr x0, [sp, 0x8]
    bl _objc_autoreleasePoolPop

    ldr w0, [sp, 0x4]
    ldp x29, x30, [sp, 0x20]
    add sp, sp, 0x30
    ret


    .section __TEXT,__cstring,cstring_literals
helloworld:
    .asciz "Hello World!\n"

s_delegateClassNameCStr:
    .asciz "AppDelegate"
