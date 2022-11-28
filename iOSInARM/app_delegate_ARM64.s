    .section __TEXT,__text,regular,pure_instructions
    .global appDelegate_Setup
    .align 4
appDelegate_Setup:
    sub sp, sp, 0x20
    stp x29, x30, [sp, 0x10]
    add x29, sp, 0x10

    adrp x0, appDelegate_ParentClassName@PAGE
    add x0, x0, appDelegate_ParentClassName@PAGEOFF
    bl _objc_getClass

    adrp x1, appDelegate_ClassName@PAGE
    add x1, x1, appDelegate_ClassName@PAGEOFF
    mov x2, 0x0
    bl _objc_allocateClassPair

    str x0, [sp]
    adrp x1, appDelegate_Class@PAGE
    add x1, x1, appDelegate_Class@PAGEOFF
    str x0, [x1]

    adrp x1, appDelegate_IvarName@PAGE
    add x1, x1, appDelegate_IvarName@PAGEOFF
    mov x2, 0x8
    mov x3, 0x0
    adrp x4, appDelegate_IvarEncoding@PAGE
    add x4, x4, appDelegate_IvarEncoding@PAGEOFF
    bl _class_addIvar

    adrp x0, appDelegate_MethodName@PAGE
    add x0, x0, appDelegate_MethodName@PAGEOFF
    bl _sel_getUid

    mov x1, x0
    ldr x0, [sp]
    adrp x2, appDelegate_DidFinishLaunching@PAGE
    add x2, x2, appDelegate_DidFinishLaunching@PAGEOFF
    adrp x3, appDelegate_MethodEncoding@PAGE
    add x3, x3, appDelegate_MethodEncoding@PAGEOFF
    bl _class_addMethod

    ldr x0, [sp]
    bl _objc_registerClassPair

    ldp x29, x30, [sp, 0x10]
    add sp, sp, 0x20
    ret

appDelegate_DidFinishLaunching:
    sub sp, sp, 0x20
    stp x29, x30, [sp, 0x10]
    add x29, sp, 0x10


    ldp x29, x30, [sp, 0x10]
    add sp, sp, 0x20
    ret

    .section __TEXT,__cstring
appDelegate_ParentClassName:
    .asciz "NSObject"

appDelegate_ClassName:
    .asciz "AppDelegate"

appDelegate_IvarName:
    .asciz "window"

appDelegate_IvarEncoding:
    .asciz "@"

appDelegate_MethodName:
    .asciz "application:didFinishLaunchingWithOptions:"

appDelegate_MethodEncoding:
    .asciz "c@:@@"

appDelegate_ScreenClassName:
    .asciz "UIScreen"

appDelegate_ScreenSingletonMethodName:
    .asciz "mainScreen"

appDelegate_ScreenSizePropertyName:
    .asciz "bounds"

appDelegate_WindowClassName:
    .asciz "UIWindow"

appDelegate_WindowAllocateMethodName:
    .asciz "alloc"

appDelegate_WindowInitMethodName:
    .asciz "initWithFrame:"

appDelegate_ViewControllerClassName:
    .asciz "UIViewController"

appDelegate_ViewControllerAllocateMethodName:
    .asciz "alloc"

appDelegate_ViewControllerInitMethodName:
    .asciz "init"

appDelegate_ViewControllerAttachViewMethodName:
    .asciz "setView:"

appDelegate_ViewControllerAttachMethodName:
    .asciz "setRootViewController:"

appDelegate_ViewClassName:
    .asciz "View"

appDelegate_ViewAllocateMethodName:
    .asciz "alloc"

appDelegate_ViewInitMethodName:
    .asciz "initWithFrame:"

appDelegate_WindowMakeVisibleMethodName:
    .asciz "makeKeyAndVisible"

    .section __DATA,regular
    .align 4
appDelegate_Class:
    .long 0

appDelegate_Window:
    .long 0

appDelegate_ScreenSize:
    .float 0, 0, 0, 0 // x, y, width, height
