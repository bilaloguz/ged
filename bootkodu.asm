boot_dev  db      0 
diff16 "kod_basla: ",0,$ 
start_of_code:
        cld
        mov     ax, 3000h
        mov     ss, ax
        mov     sp, 0EC00h
        push    cs
        pop     ds
        push    cs
        pop     es
cpugood:
        xor     ax, ax
        push    ax
        popf
        sti
        movzx   esp, sp
        push    ax
        pop     es
cfgmanager:
 DMA ACCESS TO HD 
        xor     ax, ax
        mov     [boot_dev], al
        mov     ax, 0xA000          
        mov     cx, 0x550A          
setgr:
        int     0x10
        test    ah, ah
        jnz     $
        mov     ax, 0xA006             
        int     0x10
        mov     [es:0x9018], ebx        
gmok2:
        push    ds
        pop     es
