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
    sub sp, sp, 0x50
    stp x29, x30, [sp, 0x40]
    add x29, sp, 0x40

    str x0, [sp, 0x8]

    ;; Get Screen Size
    adrp x0, appDelegate_ScreenSingletonMethodName@PAGE
    add x0, x0, appDelegate_ScreenSingletonMethodName@PAGEOFF
    bl _sel_getUid
    str x0, [sp, 0x10]

    adrp x0, appDelegate_ScreenClassName@PAGE
    add x0, x0, appDelegate_ScreenClassName@PAGEOFF
    bl _objc_getClass

    ldr x1, [sp, 0x10]
    bl _objc_msgSend
    str x0, [sp, 0x10]

    adrp x0, appDelegate_ScreenSizePropertyName@PAGE
    add x0, x0, appDelegate_ScreenSizePropertyName@PAGEOFF
    bl _sel_getUid

    mov x1, x0
    ldr x0, [sp, 0x10]
    bl _objc_msgSend

    str d0, [sp, 0x20]
    str d1, [sp, 0x28]
    str d2, [sp, 0x30]
    str d3, [sp, 0x38]

    ;; Create UIWindow
    adrp x0, appDelegate_WindowInitMethodName@PAGE
    add x0, x0, appDelegate_WindowInitMethodName@PAGEOFF
    bl _sel_getUid
    str x0, [sp, 0x10]

    adrp x0, appDelegate_WindowClassName@PAGE
    add x0, x0, appDelegate_WindowClassName@PAGEOFF
    bl _objc_getClass
    str x0, [sp, 0x18]

    adrp x0, appDelegate_AllocMethodName@PAGE
    add x0, x0, appDelegate_AllocMethodName@PAGEOFF
    bl _sel_getUid

    mov x1, x0
    ldr x0, [sp, 0x18]
    bl _objc_msgSend

    ldr d0, [sp, 0x20]
    ldr d1, [sp, 0x28]
    ldr d2, [sp, 0x30]
    ldr d3, [sp, 0x38]
    ldr x1, [sp, 0x10]
    bl _objc_msgSend
    str x0, [sp]

    ;; Create and set root ViewController
    adrp x0, appDelegate_ViewControllerClassName@PAGE
    add x0, x0, appDelegate_ViewControllerClassName@PAGEOFF
    bl _objc_getClass
    str x0, [sp, 0x8]

    adrp x0, appDelegate_AllocMethodName@PAGE
    add x0, x0, appDelegate_AllocMethodName@PAGEOFF
    bl _sel_getUid

    mov x1, x0
    ldr x0, [sp, 0x8]
    bl _objc_msgSend
    str x0, [sp, 0x8]

    adrp x0, appDelegate_ViewControllerInitMethodName@PAGE
    add x0, x0, appDelegate_ViewControllerInitMethodName@PAGEOFF
    bl _sel_getUid

    mov x1, x0
    ldr x0, [sp, 0x8]
    bl _objc_msgSend
    str x0, [sp, 0x8]


    adrp x0, appDelegate_ViewClassName@PAGE
    add x0, x0, appDelegate_ViewClassName@PAGEOFF
    bl _objc_getClass
    str x0, [sp, 0x10]

    adrp x0, appDelegate_AllocMethodName@PAGE
    add x0, x0, appDelegate_AllocMethodName@PAGEOFF
    bl _sel_getUid

    mov x1, x0
    ldr x0, [sp, 0x10]
    bl _objc_msgSend
    str x0, [sp, 0x10]

    adrp x0, appDelegate_ViewInitMethodName@PAGE
    add x0, x0, appDelegate_ViewInitMethodName@PAGEOFF
    bl _sel_getUid

    mov x1, x0
    ldr x0, [sp, 0x10]
    ldr d0, [sp, 0x20]
    ldr d1, [sp, 0x28]
    ldr d2, [sp, 0x30]
    ldr d3, [sp, 0x38]
    bl _objc_msgSend
    str x0, [sp, 0x10]

    adrp x0, appDelegate_ViewControllerAttachViewMethodName@PAGE
    add x0, x0, appDelegate_ViewControllerAttachViewMethodName@PAGEOFF
    bl _sel_getUid

    mov x1, x0
    ldr x0, [sp, 0x8]
    ldr x2, [sp, 0x10]
    bl _objc_msgSend

    adrp x0, appDelegate_ViewControllerAttachMethodName@PAGE
    add x0, x0, appDelegate_ViewControllerAttachMethodName@PAGEOFF
    bl _sel_getUid

    mov x1, x0
    ldr x0, [sp]
    ldr x2, [sp, 0x8]
    bl _objc_msgSend

    adrp x0, appDelegate_WindowMakeVisibleMethodName@PAGE
    add x0, x0, appDelegate_WindowMakeVisibleMethodName@PAGEOFF
    bl _sel_getUid

    mov x1, x0
    ldr x0, [sp]
    bl _objc_msgSend

    ldp x29, x30, [sp, 0x40]
    add sp, sp, 0x50
    ret

    .section __TEXT,__cstring
appDelegate_AllocMethodName:
    .asciz "alloc"

appDelegate_ParentClassName:
    .asciz "UIResponder"

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

appDelegate_WindowInitMethodName:
    .asciz "initWithFrame:"

appDelegate_ViewControllerClassName:
    .asciz "UIViewController"

appDelegate_ViewControllerInitMethodName:
    .asciz "init"

appDelegate_ViewControllerAttachViewMethodName:
    .asciz "setView:"

appDelegate_ViewControllerAttachMethodName:
    .asciz "setRootViewController:"

appDelegate_ViewClassName:
    .asciz "View"

appDelegate_ViewInitMethodName:
    .asciz "initWithFrame:"

appDelegate_WindowMakeVisibleMethodName:
    .asciz "makeKeyAndVisible"
